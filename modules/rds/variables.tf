variable "name" {
  description = "Name/identifier for the RDS DB instance."
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes."
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "Upper limit to which RDS can automatically scale the storage (GB)."
  type        = number
  default     = null
}

variable "storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD)."
  type        = string
  default     = "gp2"
}

variable "engine" {
  description = "Database engine type (e.g. postgres, mysql)."
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "Database engine version."
  type        = string
  default     = null
}

variable "instance_class" {
  description = "Instance class for the database."
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Name of the initial database to create inside the instance."
  type        = string
  default     = null
}

variable "username" {
  description = "Master username for the database."
  type        = string
  default     = "dbuser"
}

variable "password" {
  description = "Master password for the database."
  type        = string
  default     = "dbpassword123!"
  sensitive   = true
}

variable "port" {
  description = "Port on which the DB accepts connections."
  type        = number
  default     = null
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted."
  type        = bool
  default     = true
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to the RDS resource."
  type        = map(string)
  default     = {}
}

