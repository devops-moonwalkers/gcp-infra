resource "google_compute_address" "regional_external_ip" {
  provider      = google
  name          = "static-ingres-ip"
  address_type  = "EXTERNAL"
  region        = "us-central1"
}
