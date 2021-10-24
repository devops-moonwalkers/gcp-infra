provider "google" {
  alias   = "gcp-provider"
  project = var.gcp_project_id
  region  = var.gcp_region
}
