terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.3"
    }
  }
  backend "artifactory" {
    repo    = "tfstate-generic-local"
    subpath = "cloudflare"
  }
}

provider "cloudflare" {
  # Email and API Token read from environment variables
}

variable "zone_id" {
  default = "05d8538fd89486d425bd9e2e25d8bf79"
}

module "improvmx_mail" {
  source  = "../modules/improvmx"
  zone_id = var.zone_id
}

module "dns_records" {
  source  = "../modules/dns"
  zone_id = var.zone_id
}