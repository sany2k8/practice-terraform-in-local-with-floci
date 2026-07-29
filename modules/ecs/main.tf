resource "aws_ecs_cluster" "this" {
  name = var.cluster_name
  tags = var.tags
}

# A task definition describing which container(s) to run. Uses the EC2 launch
# type with bridge networking to keep the lab free of VPC/execution-role setup.
resource "aws_ecs_task_definition" "this" {
  family             = var.family
  network_mode       = "bridge"
  cpu                = var.cpu
  memory             = var.memory
  requires_compatibilities = ["EC2"]

  container_definitions = jsonencode([{
    name      = var.container_name
    image     = var.container_image
    cpu       = var.cpu
    memory    = var.memory
    essential = true
    portMappings = [{
      containerPort = var.container_port
      hostPort      = 0
    }]
  }])

  tags = var.tags
}
