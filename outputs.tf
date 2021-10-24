output "id" {
  value       = google_project.project.project_id
  description = "GCP project ID"
}

output "number" {
  value       = google_project.project.number
  description = "GCP project number"
  sensitive   = true
}
output "bucket_name" {
  value = google_storage_bucket.state.name
}

output "addresses" {
  description = "Global IPv4 address for proxy load balancing to the nearest Ingress controller"
  value       = google_compute_address.regional_external_ip.address
}

output "name" {
  description = "Static IP Name"
  value       = google_compute_address.regional_external_ip.name
}