variable "hosted-zone" {
  type = string
  default = "hashidemos.io"
}

variable "namespace" {
  type = string
  description = "HashiCorp email prefix"
}

variable "owner" {
  type = string
  description = "The person or group who launched these resources.  Must be a valid HashiCorp email address."
}

variable "azure_location" {
  type = string
  default = "westus"
}

variable "gcp_project" {
  type = string
  description = "Existing GCP Project"
}
