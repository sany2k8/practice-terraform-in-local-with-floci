output "cluster_name" {
  description = "Name of the cluster."
  value       = aws_eks_cluster.this.name
}

output "cluster_arn" {
  description = "ARN of the cluster."
  value       = aws_eks_cluster.this.arn
}

output "endpoint" {
  description = "Kubernetes API server endpoint."
  value       = aws_eks_cluster.this.endpoint
}

output "status" {
  description = "Current status of the cluster."
  value       = aws_eks_cluster.this.status
}
