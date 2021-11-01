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

resource "cloudflare_record" "mail-redirect-1" {
  zone_id         = var.zone_id
  name            = "@"
  value           = "mx1.improvmx.com"
  type            = "MX"
  proxied         = false
  priority        = 10
  allow_overwrite = true
}

resource "cloudflare_record" "mail-redirect-2" {
  zone_id         = var.zone_id
  name            = "@"
  value           = "mx2.improvmx.com"
  type            = "MX"
  proxied         = false
  priority        = 20
  allow_overwrite = true
}

resource "cloudflare_record" "spf-record" {
  zone_id         = var.zone_id
  name            = "@"
  value           = "v=spf1 inlcude:spf.improvmx.com ~all"
  type            = "TXT"
  proxied         = false
  allow_overwrite = true
}

resource "cloudflare_record" "dmarc-record" {
  zone_id         = var.zone_id
  name            = "_dmarc"
  value           = "v=DMARC1; p=reject; rua-mailto:vivaan.verma@gmail.com"
  type            = "TXT"
  proxied         = false
  allow_overwrite = true
}