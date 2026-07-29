variable "function_name" {
  description = "Name of the Lambda function."
  type        = string
}

variable "role_arn" {
  description = "ARN of the IAM execution role the function assumes."
  type        = string
}

variable "source_dir" {
  description = "Path to a directory whose contents are zipped as the deployment package."
  type        = string
}

variable "handler" {
  description = "Function entrypoint, e.g. handler.lambda_handler."
  type        = string
  default     = "handler.lambda_handler"
}

variable "runtime" {
  description = "Lambda runtime identifier."
  type        = string
  default     = "python3.12"
}

variable "timeout" {
  description = "Timeout in seconds."
  type        = number
  default     = 10
}

variable "memory_size" {
  description = "Memory in MB."
  type        = number
  default     = 128
}

variable "environment" {
  description = "Environment variables passed to the function."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags to apply to the function."
  type        = map(string)
  default     = {}
}
