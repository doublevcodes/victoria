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

resource "cloudflare_access_application" "ssh_in_browser" {
  zone_id = var.zone_id
  name    = "SSH in Browser"
  domain  = "ssh.${var.domain}"
  type    = "ssh"
}
