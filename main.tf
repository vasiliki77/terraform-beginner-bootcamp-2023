terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
    cloud {
    organization = "example-org-da89f8"

    workspaces {
      name = "terra-house-1"
    }
  }
}
provider "terratowns" {
  endpoint   = var.terratowns_endpoint
  user_uuid  = var.teacherseat_user_uuid
  token      = var.terratowns_access_token
}
module "home_spongebob_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.spongebob.public_path
  content_version = var.spongebob.content_version
}

resource "terratowns_home" "home_spondebob" {
  name = "Living underwater!!"
  description = <<DESCRIPTION
Bikini Bottom is a real place.
It's a fresh water bubble on the ocean floor.
DESCRIPTION
  domain_name = module.home_spongebob_hosting.domain_name
  town = "video-valley"
  content_version = var.spongebob.content_version
}

module "home_lacta_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.lacta.public_path
  content_version = var.lacta.content_version
}

resource "terratowns_home" "home_lacta" {
  name = "Lacta lover!!"
  description = <<DESCRIPTION
Lacta is the best chocolate in the world!
It's the best valentines gift.
DESCRIPTION
  domain_name = module.home_lacta_hosting.domain_name
  town = "cooker-cove"
  content_version = var.lacta.content_version
}