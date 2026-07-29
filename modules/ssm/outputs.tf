output "name" {
  description = "Name of the parameter."
  value       = aws_ssm_parameter.this.name
}

output "arn" {
  description = "ARN of the parameter."
  value       = aws_ssm_parameter.this.arn
}

output "version" {
  description = "Version number of the parameter."
  value       = aws_ssm_parameter.this.version
}
