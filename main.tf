provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

provider "google-beta" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

module "moonwalkers-gke" {
  source         = "app.terraform.io/moonwalkers/moonwalkers-gke/gcp"
  version        = "1.0.5"
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
}
