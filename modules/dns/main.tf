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


resource "cloudflare_record" "www_redirect" {
  zone_id         = var.zone_id
  name            = "www"
  value           = "@"
  type            = "CNAME"
  proxied         = true
  allow_overwrite = true
}

resource "cloudflare_record" "site_record" {
  zone_id         = var.zone_id
  name            = "@"
  value           = "76.76.21.21"
  type            = "A"
  proxied         = false # Otherwise Vercel breaks
  allow_overwrite = true
}

resource "cloudflare_record" "http_cloudflare_tunnel" {
  zone_id         = var.zone_id
  name            = "localhost"
  value           = "586bf1f3-9bd6-47c8-838e-25c3559d0552.cfargotunnel.com."
  type            = "CNAME"
  proxied         = true
  allow_overwrite = true
}

resource "cloudflare_record" "ssh_cloudflare_tunnel" {
  zone_id         = var.zone_id
  name            = "ssh"
  value           = "586bf1f3-9bd6-47c8-838e-25c3559d0552.cfargotunnel.com."
  type            = "CNAME"
  proxied         = true
  allow_overwrite = true
}

resource "cloudflare_record" "git_subdomain" {
  zone_id         = var.zone_id
  name            = "git"
  value           = "100::"
  type            = "AAAA"
  proxied         = true
  allow_overwrite = true
}

