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