variable "gcp_region" {
  type        = string
  description = "The GCP Region"
  default     = "us-central1"
}

variable "gcp_project_id" {
  type        = string
  description = "The GCP Seeding project ID"
  default     = ""
}
variable "billing_account" {
  description = "The billing account ID for this project"
}

variable "project_name" {
  description = "The human readable project name (min 4 letters)"
}

variable "auto_create_network" {
  description = "If a default network is to be created. True or False"
}
variable "bucket_name" {
  description = "The name of the bucket."
}

variable "storage_class" {
  description = "Bucket storage class"
  default     = "MULTI_REGIONAL"
}
