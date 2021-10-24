gcp_project_id      = "tobedecided"
gcp_region          = "us-central1"
billing_account     = "tobedecided"
auto_create_network = "false"
bucket_name         = "devops-temp-statebucket"
storage_class       = "Standard"

org            = "nicolas"
product        = "notepad"
environment    = "dev"

#subnet vars
network_cidr       = "10.128.1.0/26"
pods_cidr          = "172.0.0.0/18"
pods_cidr_name     = "pods"
services_cidr      = "172.10.0.0/21"
services_cidr_name = "services"
#gke specific
enable_private_nodes   = "true"
master_ipv4_cidr_block = "172.16.0.0/28"
pods_range_name        = "pods"
services_range_name    = "services"
kubernetes_version     = "1.20.8-gke.700"
#pool specifc
gke_pool_node_count   = "1"
gke_pool_image_type   = "COS"
gke_pool_disk_size_gb = "100"
gke_pool_disk_type    = "pd-standard"
gke_pool_machine_type = "e2-small"