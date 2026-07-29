output "repository_name" {
  description = "Name of the repository."
  value       = aws_ecr_repository.this.name
}

output "repository_url" {
  description = "URL of the repository (use as the docker push/pull target)."
  value       = aws_ecr_repository.this.repository_url
}

output "repository_arn" {
  description = "ARN of the repository."
  value       = aws_ecr_repository.this.arn
}
