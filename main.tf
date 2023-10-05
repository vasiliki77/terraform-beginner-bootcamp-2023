terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
#cloud {
#  organization = "example-org-da89f8"
#
#  workspaces {
#    name = "terra-house-1"
#  }
}

provider "terratowns" {
  endpoint   = var.terratowns_endpoint
  user_uuid  = var.teacherseat_user_uuid
  token      = var.terratowns_access_token
}
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  bucket_name = var.bucket_name
  error_html_filepath = var.error_html_filepath
  index_html_filepath = var.index_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
}

resource "terratowns_home" "home" {
  name = "Living underwater!!"
  description = <<DESCRIPTION
Bikini Bottom is a real place.
It's a fresh water bubble on the ocean floor.
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  town = "missingo"
  content_version = 1
}
