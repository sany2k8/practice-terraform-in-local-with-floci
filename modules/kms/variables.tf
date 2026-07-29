variable "description" {
  description = "Description of the KMS key."
  type        = string
  default     = "Managed by Terraform (Floci lab)"
}

variable "alias_name" {
  description = "Optional alias for the key (without the 'alias/' prefix)."
  type        = string
  default     = null
}

variable "deletion_window_in_days" {
  description = "Waiting period before the key is deleted (7-30)."
  type        = number
  default     = 7
}

variable "enable_key_rotation" {
  description = "Whether to enable automatic annual key rotation."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to the key."
  type        = map(string)
  default     = {}
}
