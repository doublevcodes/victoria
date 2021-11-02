terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 3.3"
    }
  }
}

provider "cloudflare" {
  
}

variable "zone_id" {
  type = string
}


resource "cloudflare_record" "www-redirect" {
  zone_id         = var.zone_id
  name            = "www"
  value           = var.domain
  type            = "CNAME"
  proxied         = true
  allow_overwrite = true
}

resource "cloudflare_record" "site-record" {
  zone_id         = var.zone_id
  name            = "@"
  value           = "76.76.21.21"
  type            = "A"
  proxied         = false # Otherwise Vercel breaks
  allow_overwrite = true
}

resource "cloudflare_record" "git-shortcut" {
  zone_id         = var.zone_id
  name            = "git"
  value           = "100::"
  type            = "AAAA"
  proxied         = true
  allow_overwrite = true
}

resource "cloudflare_record" "easter-egg-txt" {
  zone_id         = var.zone_id
  name            = "@"
  value           = "Hello from me!"
  type            = "TXT"
  proxied         = false
  allow_overwrite = true
}