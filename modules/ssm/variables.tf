variable "name" {
  description = "Name (path) of the SSM parameter, e.g. /myapp/db/password."
  type        = string
}

variable "value" {
  description = "Value to store."
  type        = string
  sensitive   = true
}

variable "type" {
  description = "Parameter type: String, StringList, or SecureString."
  type        = string
  default     = "String"

  validation {
    condition     = contains(["String", "StringList", "SecureString"], var.type)
    error_message = "type must be one of String, StringList, or SecureString."
  }
}

variable "key_id" {
  description = "KMS key id/ARN used to encrypt a SecureString (defaults to the AWS-managed key)."
  type        = string
  default     = null
}

variable "tier" {
  description = "Parameter tier: Standard, Advanced, or Intelligent-Tiering."
  type        = string
  default     = "Standard"
}

variable "tags" {
  description = "Tags to apply to the parameter."
  type        = map(string)
  default     = {}
}
