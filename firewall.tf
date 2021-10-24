resource "google_compute_firewall" "ssh-rule" {
  name =   format("allow-tcp-ssh-icmp-%s-%s-%s", var.org, var.product, var.environment)
  network = google_compute_network.vpc_network.self_link
  allow {
    protocol = "tcp"
    ports = ["22"]
  }
  allow {
    protocol = "icmp"
  }
}
