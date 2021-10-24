variable "kubernetes_version" {
  default     = ""
  type        = string
  description = "The GKE version of Kubernetes"
}

variable "logging_service" {
  description = "The logging service that the cluster should write logs to."
  default     = "logging.googleapis.com/kubernetes"
}

variable "monitoring_service" {
  default     = "monitoring.googleapis.com/kubernetes"
  description = "The GCP monitoring service scope"
}

variable "disable_http_load_balancing" {
  default     = false
  description = "Enable HTTP Load balancing GCP integration"
}

variable "network_policy" {
  description = "Enable network policy addon"
  default     = true
}

variable "pods_range_name" {
  description = "The pre-defined IP Range the Cluster should use to provide IP addresses to pods"
  default     = ""
}

variable "services_range_name" {
  description = "The pre-defined IP Range the Cluster should use to provide IP addresses to services"
  default     = ""
}

variable "enable_private_nodes" {
  default     = false
  description = "Enable Private-IP Only GKE Nodes"
}

variable "enable_private_endpoint" {
  default     = false
  description = "When true, the cluster's private endpoint is used as the cluster endpoint and access through the public endpoint is disabled."
}

variable "master_ipv4_cidr_block" {
  description = "The ipv4 cidr block that the GKE masters use"
}

#Node Pool specific variables
variable "gke_pool_machine_type" {
  type = string
}
variable "gke_pool_node_count" {
  type = number
}
variable "gke_pool_disk_type" {
  type = string
  default = "pd-standard"
}
variable "gke_pool_disk_size_gb" {
  type = string
}
variable "gke_pool_image_type" {
  type = string
}