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


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name
# https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  tags = {
    UserUuid = var.user_uuid
  }
}
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration
resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.website_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object
resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = var.index_html_filepath

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5(var.index_html_filepath)
}

resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "error.html"
  source = var.error_html_filepath

  etag = filemd5(var.error_html_filepath)
}