module "ssh_in_browser" {
  source  = "../modules/access_apps"
  zone_id = var.vivaanverma_zone_id
  domain  = var.vivaanverma_domain
}
