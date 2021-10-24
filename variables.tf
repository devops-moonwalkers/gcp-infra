variable "gcp_region" {
  type        = string
  description = "The GCP Region"
  default     = "us-central1"
}

variable "gcp_project_id" {
  type        = string
  description = "The newly created GCP project ID"
}

variable "billing_account" {
  type        = string
  description = "The GCP billing account "
}

variable "org" {
  type = string
}
variable "product" {
  type = string
}
variable "environment" {
  type = string
}

# variables used to create VPC

variable "network_cidr" {
  type = string
}
variable "pods_cidr" {
  type = string
}
variable "pods_cidr_name" {
  type = string
}
variable "services_cidr" {
  type = string
}
variable "services_cidr_name" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "auto_create_network" {
  type = string
}

variable "storage_class" {
  type = string
}