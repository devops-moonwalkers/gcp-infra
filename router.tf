resource "google_compute_router" "gke_net_router" {
  project = var.gcp_project_id
  name    = "gke-net-router"
  region  = var.gcp_region
  network = google_compute_network.vpc_network.self_link
  bgp {
    asn = 64514
  }
}
