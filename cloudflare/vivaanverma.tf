terraform {
    required_providers {
        cloudflare = {
            source  = "cloudflare/cloudflare"
            version = "~> 3.3.0"
        }
    }
}

provider "cloudflare" {
    # Email and API Token read from environment variables
}

# Details found on the Cloudflare Dashboard - "DNS" tab
variable "zone_id" {
    default = "05d8538fd89486d425bd9e2e25d8bf79"
}

variable "domain" {
    default = "vivaanverma.com"
}

# DNS Records
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
    proxied         = true
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