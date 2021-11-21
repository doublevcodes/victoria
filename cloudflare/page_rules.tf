module "vivaanverma_page_rules" {
  source  = "../modules/page_rules"
  zone_id = var.vivaanverma_zone_id
  domain  = var.vivaanverma_domain
}

module "doublevcodes_page_rules" {
  source  = "../modules/page_rules"
  zone_id = var.doublevcodes_zone_id
  domain  = var.doublevcodes_domain
}
