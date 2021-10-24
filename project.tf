#locals {
#  project_id = "${var.project_name}"
#}

resource "google_project" "project" {
  name                = var.gcp_project_id
  billing_account     = var.billing_account
  project_id          = var.gcp_project_id
  auto_create_network = var.auto_create_network
}
