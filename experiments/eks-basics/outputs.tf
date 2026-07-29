output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.endpoint
}

output "cluster_status" {
  value = module.eks.status
}
