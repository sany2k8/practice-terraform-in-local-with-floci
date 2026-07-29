output "cluster_arn" {
  value = module.ecs.cluster_arn
}

output "task_definition_arn" {
  value = module.ecs.task_definition_arn
}
