terraform {
  cloud {
    organization = "example-org-da89f8"

    workspaces {
      name = "terra-house-1"
    }
  }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}


provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}

# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
resource "random_string" "bucket_name" {
  lower            = true
  upper            = false
  length           = 32
  special          = false
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
# https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

output "random_bucket_name" {
    value = random_string.bucket_name.result
}