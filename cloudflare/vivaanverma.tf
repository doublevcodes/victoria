terraform {
    required_providers {
      cloudflare = {
          source = "cloudflare/cloudflare"
          version = "~> 3.3.0"
      }
    }
}

provider "cloudflare" {
    # Email and API Token read from environment variables
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
    allow_overwrite = true
}

resource "cloudflare_zone_settings_override" "vivaanverma-com-settings" {
    zone_id = var.zone_id
    settings {
        always_online = "on"
        always_use_https = "on"
        brotli = "on"
        hotlink_protection = "on"
        http3 = "on"
        rocket_loader = "on"
        min_tls_version = "1.3"
        ssl = "strict"
        tls_1_3 = "on"
    }
}
