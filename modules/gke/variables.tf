variable "gcp_region" {
  type        = string
  description = "The GCP Region"
}

variable "gcp_project_id" {
  type        = string
  description = "GCP project ID"
}

variable "org" {
  type = string
  default = "ycit021"
}
variable "product" {
  type = string
  default = "project"
}
variable "environment" {
  type = string
  default = "dev"
}

# variables used to create VPC
variable "network_cidr" {
  type = string
  default = "10.128.1.0/26"
}
variable "pods_cidr" {
  type = string
  default = "172.0.0.0/18"
}
variable "pods_cidr_name" {
  type = string
  default = "pods"
}
variable "services_cidr" {
  type = string
  default = "172.10.0.0/21"
}
variable "services_cidr_name" {
  type = string
  default = "services"
}

variable "auto_create_network" {
  type = string
  default = "false"
}

variable "storage_class" {
  type = string
  default = "Standard"
}

#gke specific
variable "enable_private_nodes" {
  type = string
  default = "true"
}

variable "master_ipv4_cidr_block" {
  type = string
  default = "172.16.0.0/28"
}

variable "pods_range_name" {
  type = string
  default = "pods"
}

variable "services_range_name" {
  type = string
  default = "services"
}

variable "kubernetes_version" {
  type = string
  default = "1.20.10-gke.1600"
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

variable "enable_private_endpoint" {
  default     = false
  description = "When true, the cluster's private endpoint is used as the cluster endpoint and access through the public endpoint is disabled."
}

#pool specifc
variable "gke_pool_node_count" {
  type = string
  default = "1"
}

variable "gke_pool_image_type" {
  type = string
  default = "COS"
}

variable "gke_pool_disk_size_gb" {
  type = string
  default = "100"
}

variable "gke_pool_machine_type" {
  type = string
  default = "e2-small"
}

variable "gke_pool_disk_type" {
  type = string
  default = "pd-standard"
}

