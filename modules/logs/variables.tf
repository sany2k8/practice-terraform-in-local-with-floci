variable "name" {
  description = "Name of the CloudWatch log group, e.g. /myapp/api."
  type        = string
}

variable "retention_in_days" {
  description = "How long to retain log events (0 = never expire)."
  type        = number
  default     = 7
}

variable "stream_name" {
  description = "Optional log stream to create inside the group."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to the log group."
  type        = map(string)
  default     = {}
}
