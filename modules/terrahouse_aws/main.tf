terraform {
#cloud {
#  organization = "example-org-da89f8"
#
#  workspaces {
#    name = "terra-house-1"
#  }
#}
  required_providers {
#    random = {
#      source = "hashicorp/random"
#      version = "3.5.1"
#    }
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}


#provider "aws" {
  #region     = "us-west-2"
  #access_key = "my-access-key"
  #secret_key = "my-secret-key"
#}

#provider "random" {
#  # Configuration options
#}


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name
# https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  tags = {
    UserUuid = var.user_uuid
    Environment = "Dev"
  }
}