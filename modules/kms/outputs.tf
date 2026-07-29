output "key_id" {
  description = "The globally unique identifier for the key."
  value       = aws_kms_key.this.key_id
}

output "key_arn" {
  description = "ARN of the key."
  value       = aws_kms_key.this.arn
}

output "alias_arn" {
  description = "ARN of the alias, if one was created."
  value       = try(aws_kms_alias.this[0].arn, null)
}
