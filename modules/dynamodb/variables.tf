variable "table_name" {
  description = "Name of the DynamoDB table."
  type        = string
}

variable "hash_key" {
  description = "Name of the partition (hash) key attribute."
  type        = string
}

variable "hash_key_type" {
  description = "Type of the hash key: S (string), N (number), or B (binary)."
  type        = string
  default     = "S"
}

variable "billing_mode" {
  description = "Billing mode: PAY_PER_REQUEST or PROVISIONED."
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "tags" {
  description = "Tags to apply to the table."
  type        = map(string)
  default     = {}
}
