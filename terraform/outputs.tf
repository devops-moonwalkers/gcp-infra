output "vpc_name" {
  value = google_compute_network.vpc_network.name
}
output "vpc_selflink" {
  value = "${google_compute_network.vpc_network.self_link}"
}
output "subnet_selflink" {
  value = "${google_compute_subnetwork.gke_private_subnet.self_link}"
}
output "subnet_id" {
  value = "${google_compute_subnetwork.gke_private_subnet.id}"
}
output "id" {
  value = "${google_container_cluster.primary_cluster.id}"
}
output "endpoint" {
  value = "${google_container_cluster.primary_cluster.endpoint}"
}
output "master_version" {
  value = "${google_container_cluster.primary_cluster.master_version}"
}
