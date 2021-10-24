locals {
  project_id = "${var.project_name}"
}

resource "google_project" "project" {
  name                = var.project_name
  billing_account     = var.billing_account
  project_id          = local.project_id
  auto_create_network = var.auto_create_network
}
