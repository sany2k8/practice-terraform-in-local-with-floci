resource "aws_eks_cluster" "this" {
  name     = var.name
  role_arn = var.role_arn
  version  = var.k8s_version

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  tags = var.tags
}
