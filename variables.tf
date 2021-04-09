variable "hosted-zone" {
  type        = string
  default = "hashidemos.io"
}

variable "namespace" {
  type        = string
  description = "email prefix"
}

variable "owner" {
  type        = string
  description = "Email address of owner."
}

variable "azure_location" {
  type        = string
  default = "westus"
}

variable "gcp_project" {
  type        = string
  description = "Existing GCP Project"
}

variable "create_azure_dns_zone" {
  type        = bool
  description = "Whether to create Azure DNS Zone"
  default     = true
}

variable "create_gcp_dns_zone" {
  type        = bool
  description = "Whether to create GCP DNS Zone"
  default     = true
}
