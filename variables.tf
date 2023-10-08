variable "teacherseat_user_uuid" {
    type = string
}

variable "terratowns_access_token" {
    type = string
}

variable "terratowns_endpoint" {
  type = string
}

# variable "bucket_name" {
#   type = string
# }

variable "spongebob" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "lacta" {
  type = object({
    public_path = string
    content_version = number
  })
}

