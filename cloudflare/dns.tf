terraform {
    required_providers {
      cloudflare = {
          source = "cloudflare/cloudflare"
          version = "~> 3.3.0"
      }
    }
}

provider "cloudflare" {
    # Email pulled from $CLOUDFLARE_EMAIL
    # Token pulled from $CLOUDFLARE_API_TOKEN
}

variable "zone_id" {
    default = "05d8538fd89486d425bd9e2e25d8bf79"
}

variable "domain" {
    default = "vivaanverma.com"
}

resource "cloudflare_record" "www" {
    zone_id = var.zone_id
    name    = "www"
    value   = var.domain
    type    = "CNAME"
    proxied = true
}
