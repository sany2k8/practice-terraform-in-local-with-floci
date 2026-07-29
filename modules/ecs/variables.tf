variable "cluster_name" {
  description = "Name of the ECS cluster."
  type        = string
}

variable "family" {
  description = "Family name for the task definition."
  type        = string
}

variable "container_name" {
  description = "Name of the container."
  type        = string
  default     = "app"
}

variable "container_image" {
  description = "Container image to run."
  type        = string
  default     = "nginx:latest"
}

variable "container_port" {
  description = "Port the container listens on."
  type        = number
  default     = 80
}

variable "cpu" {
  description = "CPU units for the container/task."
  type        = number
  default     = 256
}

variable "memory" {
  description = "Memory (MiB) for the container/task."
  type        = number
  default     = 512
}

variable "tags" {
  description = "Tags to apply to the cluster and task definition."
  type        = map(string)
  default     = {}
}
