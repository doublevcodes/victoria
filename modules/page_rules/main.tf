terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.3"
    }
  }
}

variable "zone_id" {
  type = string
}

variable "domain" {
  type = string
}

resource "cloudflare_page_rule" "git_subdomain" {
  zone_id = var.zone_id
  target  = "git.${var.domain}/*"
  actions {
    forwarding_url {
      url         = "https://github.com/doublevcodes/$1"
      status_code = 301
    }
  }
}
