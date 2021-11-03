provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

provider "google-beta" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

module "gke" {
  source = "./modules/gke"

  gcp_project_id = "devops-practices-and-tools"
}
