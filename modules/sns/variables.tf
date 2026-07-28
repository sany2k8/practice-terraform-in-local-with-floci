variable "name" {
  description = "Name of the SNS topic."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the topic."
  type        = map(string)
  default     = {}
}
