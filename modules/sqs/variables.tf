variable "queue_name" {
  description = "Name of the SQS queue."
  type        = string
}

variable "fifo_queue" {
  description = "Whether to create a FIFO queue (name must end in .fifo)."
  type        = bool
  default     = false
}

variable "visibility_timeout_seconds" {
  description = "Visibility timeout for messages."
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags to apply to the queue."
  type        = map(string)
  default     = {}
}
