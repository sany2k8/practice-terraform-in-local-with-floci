output "cluster_name" {
  description = "Name of the cluster."
  value       = aws_ecs_cluster.this.name
}

output "cluster_arn" {
  description = "ARN of the cluster."
  value       = aws_ecs_cluster.this.arn
}

output "task_definition_arn" {
  description = "ARN of the task definition (includes the revision)."
  value       = aws_ecs_task_definition.this.arn
}
