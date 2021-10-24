resource "google_storage_bucket" "state" {
  name          = var.bucket_name
  project       = var.gcp_project_id
  storage_class = var.storage_class
  force_destroy = "true"
  versioning {
    enabled = "true"
  }
}
