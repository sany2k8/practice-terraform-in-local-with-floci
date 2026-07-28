variable "name" {
  description = "Name of the secret."
  type        = string
}

variable "description" {
  description = "Description of the secret."
  type        = string
  default     = null
}

variable "kms_key_id" {
  description = "ARN or Id of the AWS KMS key to be used to encrypt the secret values in the secret."
  type        = string
  default     = null
}

variable "recovery_window_in_days" {
  description = "Number of days that AWS Secrets Manager waits before it can delete the secret. (Set to 0 for immediate deletion)."
  type        = number
  default     = 0
}

variable "secret_string" {
  description = "Text or JSON string to store as the secret version content."
  type        = string
  default     = null
  sensitive   = true
}

variable "secret_key_values" {
  description = "Map of key-value pairs to store as a JSON string secret version content."
  type        = map(string)
  default     = null
  sensitive   = true
}

variable "tags" {
  description = "Tags to apply to the secret."
  type        = map(string)
  default     = {}
}

