provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

provider "google-beta" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

module "moonwalkers-gke" {
  source  = "app.terraform.io/hilmaja/moonwalkers-gke/gcp"
  version = "1.0.1"
  gcp_project_id = "devops-practices-and-tools"
  gcp_region = "us-central1"
}
