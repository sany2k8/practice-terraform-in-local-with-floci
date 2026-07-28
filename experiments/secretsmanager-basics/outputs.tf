output "secret_arn" {
  description = "ARN of the secret."
  value       = module.secretsmanager.secret_arn
}

output "secret_name" {
  description = "Name of the secret."
  value       = module.secretsmanager.secret_name
}

