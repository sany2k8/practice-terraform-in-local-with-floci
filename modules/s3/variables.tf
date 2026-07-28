variable "bucket_name" {
  description = "Name of the S3 bucket to create."
  type        = string
}

variable "versioning" {
  description = "Whether to enable object versioning on the bucket."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to the bucket."
  type        = map(string)
  default     = {}
}
