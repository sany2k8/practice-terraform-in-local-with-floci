variable "name" {
  description = "Name of the EKS cluster."
  type        = string
}

variable "role_arn" {
  description = "ARN of the IAM role the EKS control plane assumes (trust: eks.amazonaws.com)."
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the cluster's VPC config (at least two)."
  type        = list(string)
}

variable "k8s_version" {
  description = "Kubernetes version (null = provider/Floci default)."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to the cluster."
  type        = map(string)
  default     = {}
}
