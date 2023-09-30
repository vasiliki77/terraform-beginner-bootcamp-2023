variable "user_uuid" {
  description = "The UUID of the user"
  type        = string
  validation {
    condition     = can(regex("^([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$", var.user_uuid))
    error_message = "user_uuid must be a valid UUID in the format 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'"
  }
}

variable "bucket_name" {
  description = "Name of the AWS S3 bucket"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9.-]{3,255}$", var.bucket_name))
    error_message = "bucket_name must be a valid AWS S3 bucket name."
  }
}

variable "index_html_filepath" {
  description = "Path to the index.html file for your static website"
  type = string
  # Define a custom validation function to check if the file exists
  validation {
    condition     = fileexists(var.index_html_filepath)
    error_message = "The specified index_html_filepath does not exist or is not a valid file path."
  }
}

variable "error_html_filepath" {
  description = "Path to the index.html file for your static website"
  type = string
  # Define a custom validation function to check if the file exists
  validation {
    condition     = fileexists(var.error_html_filepath)
    error_message = "The specified error_html_filepath does not exist or is not a valid file path."
  }
}

variable "content_version" {
  description = "The content version (positive integer starting at 1)"
  type        = number
  validation {
    condition     = var.content_version >= 1 && ceil(var.content_version) == floor(var.content_version)
    error_message = "Content version must be a positive integer starting at 1"
  }
  default     = 1
}

variable "assets_path" {
  description = "path to assets folder"
  type = string
}