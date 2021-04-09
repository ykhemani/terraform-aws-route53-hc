terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    azurerm = {
      source = "hashicorp/azurerm"
    }
    google = {
      source = "hashicorp/google"
    }
  }
  required_version = ">= 0.13"
}

provider "aws" {
  region  = "us-west-2"   # region is required but doesn't matter
}

provider "google" {}

provider "azurerm" {
  features {}
}

module "dns" {  
  source                = "github.com/lhaig/terraform-dns-multicloud?ref=v0.3.0"

  hosted-zone           = var.hosted-zone
  namespace             = var.namespace               # HashiCorp username
  owner                 = var.owner                   # HashiCorp email

  create_aws_dns_zone   = true               # should be set to true
  
  create_azure_dns_zone = true               # optional
  azure_location        = var.azure_location # Azure creates a resource group
                                             #   which requires a region
                                    
  create_gcp_dns_zone   = true              # optional
  gcp_project           = var.gcp_project   # name of your GCP project
}

# important outputs
output "aws_sub_zone_id" {
  value = module.dns.aws_sub_zone_id
}
output "azure_sub_zone_name" {
  value = module.dns.azure_sub_zone_name
}
output "gcp_dns_zone_name" {
  value = module.dns.gcp_dns_zone_name
}
# additional outputs listed in module repo
