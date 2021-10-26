resource "google_container_cluster" "primary_cluster" {
  provider = google-beta

  project = var.gcp_project_id

  name               = format("gke-%s-%s-%s", var.org, var.product, var.environment)
  min_master_version = var.kubernetes_version
  network            = google_compute_network.vpc_network.self_link
  subnetwork         = google_compute_subnetwork.gke_private_subnet.self_link

  location                    = var.gcp_region
  logging_service             = var.logging_service
  monitoring_service          = var.monitoring_service

  remove_default_node_pool = true
  initial_node_count       = 1

  private_cluster_config {
    enable_private_nodes   = var.enable_private_nodes
    enable_private_endpoint = var.enable_private_endpoint
    master_ipv4_cidr_block = var.master_ipv4_cidr_block
  }

  network_policy {
    enabled  = var.network_policy
    provider = var.network_policy ? "CALICO" : "PROVIDER_UNSPECIFIED"
  }

  addons_config {
    http_load_balancing {
      disabled = var.disable_http_load_balancing
    }

    network_policy_config {
      disabled = var.network_policy ? false : true
    }
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = var.pods_range_name
    services_secondary_range_name = var.services_range_name
  }

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }

  workload_identity_config {
    identity_namespace = "${var.gcp_project_id}.svc.id.goog"
  }
}

#Node Pool Resource
resource "google_container_node_pool" "preemptible-node_pool" {
  provider = google-beta
  
  name       = "main-pool"
  location = var.gcp_region
  project  = var.gcp_project_id
  cluster    = google_container_cluster.primary_cluster.name
  node_count = var.gke_pool_node_count
  version    = var.kubernetes_version

  management {
    auto_repair  = true
    auto_upgrade = true
  }
  node_config {
    preemptible  = true
    image_type   = var.gke_pool_image_type
    disk_size_gb = var.gke_pool_disk_size_gb
    disk_type    = var.gke_pool_disk_type
    machine_type = var.gke_pool_machine_type
  }

  timeouts {
    create = "10m"
    delete = "10m"
  }

  lifecycle {
    ignore_changes = [
      node_count
    ]
  }
}