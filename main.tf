# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
#resource "random_string" "bucket_name" {
#  lower            = true
#  upper            = false
#  length           = 32
#  special          = false
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

