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

module "vivaanverma_page_rules" {
  source  = "../modules/page_rules"
  zone_id = var.vivaanverma_zone_id
  domain  = var.vivaanverma_domain
}

module "doublevcodes_page_rules" {
  source  = "../modules/page_rules"
  zone_id = var.doublevcodes_zone_id
  domain  = var.doublevcodes_domain
}