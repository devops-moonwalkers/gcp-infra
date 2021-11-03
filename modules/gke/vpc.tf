resource "google_compute_network" "vpc_network" {
  name                    = format("vpc-%s-%s-%s", var.org, var.product, var.environment)
  routing_mode            = "REGIONAL"
  description             = "VPC that will be used by the GKE private cluster on the related project"
  auto_create_subnetworks = false
}
