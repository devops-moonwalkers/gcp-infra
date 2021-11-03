resource "google_compute_subnetwork" "gke_private_subnet" {
  name                     = format("subnet-%s-%s-%s", var.org, var.product, var.environment)
  network                  = google_compute_network.vpc_network.self_link
  region                   = var.gcp_region
  project                  = var.gcp_project_id
  ip_cidr_range            = var.network_cidr
  private_ip_google_access = true
  log_config {
    aggregation_interval = "INTERVAL_15_MIN"
    flow_sampling        = 0.1
    metadata             = "INCLUDE_ALL_METADATA"
  }
  secondary_ip_range {
    range_name    = var.pods_cidr_name
    ip_cidr_range = var.pods_cidr
  }
  secondary_ip_range {
    range_name    = var.services_cidr_name
    ip_cidr_range = var.services_cidr
  }
}
