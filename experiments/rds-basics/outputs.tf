output "db_instance_id" {
  description = "The RDS instance ID."
  value       = module.rds.db_instance_id
}

output "db_instance_endpoint" {
  description = "The RDS connection endpoint."
  value       = module.rds.db_instance_endpoint
}

output "db_instance_address" {
  description = "The RDS instance address."
  value       = module.rds.db_instance_address
}
