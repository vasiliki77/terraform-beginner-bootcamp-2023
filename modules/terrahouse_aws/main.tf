terraform {
#cloud {
#  organization = "example-org-da89f8"
#
#  workspaces {
#    name = "terra-house-1"
#  }
#}
  required_providers {
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

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
data "aws_caller_identity" "current" {
  
}