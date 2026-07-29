variable "name" {
  description = "Name of the IAM role."
  type        = string
}

variable "assume_role_services" {
  description = "AWS service principals allowed to assume this role (e.g. lambda.amazonaws.com)."
  type        = list(string)
  default     = ["ec2.amazonaws.com"]
}

variable "inline_policy_json" {
  description = "Optional inline policy JSON to attach to the role."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to the role."
  type        = map(string)
  default     = {}
}
