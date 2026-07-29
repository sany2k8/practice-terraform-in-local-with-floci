# Experiment: ecs-basics — an ECS cluster + an nginx task definition.
module "ecs" {
  source          = "../../modules/ecs"
  cluster_name    = "app-cluster"
  family          = "web"
  container_name  = "nginx"
  container_image = "nginx:latest"
  container_port  = 80
}
