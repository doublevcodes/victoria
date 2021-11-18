terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.3"
    }
  }

  backend "remote" {
    organization = "doublevcodes"
    workspaces {
      name = "victoria"
    }
  }

}

provider "cloudflare" {
}

variable "vivaanverma_zone_id" {
  default = "05d8538fd89486d425bd9e2e25d8bf79"
}

variable "doublevcodes_zone_id" {
  default = "6518fc46e87bdf524f6362ba4baf5136"
}

module "improvmx_mail" {
  source  = "../modules/improvmx"
  zone_id = var.vivaanverma_zone_id
}

module "vivaanverma_dns_records" {
  source  = "../modules/dns"
  zone_id = var.vivaanverma_zone_id
}

module "doublevcodes_dns_records" {
  source  = "../modules/dns"
  zone_id = var.doublevcodes_zone_id
}