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

resource "cloudflare_access_policy" "ssh_in_browser_policy" {
  application_id = cloudflare_access_application.ssh_in_browser.zone_id
  zone_id = var.zone_id
  name    = "SSH in Browser Policy"
  precedence = "1"
  decision = "allow"

  include {
    email = ["vivaan.verma@gmail.com"]
  }

  require {
    email = ["vivaan.verma@gmail.com"]
  }
}
