# Experiment: eks-basics — a managed Kubernetes (EKS) control plane.
# EKS needs supporting infra: a VPC with two subnets and a control-plane IAM
# role. The VPC/subnets are experiment-level infrastructure (created here at the
# root); the cluster itself comes from modules/eks and the role from modules/iam.

# ── Supporting network (minimal VPC + two subnets in different AZs) ──
resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
  tags       = { Name = "eks-lab-vpc" }
}

resource "aws_subnet" "a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags              = { Name = "eks-lab-subnet-a" }
}

resource "aws_subnet" "b" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags              = { Name = "eks-lab-subnet-b" }
}

# ── Control-plane IAM role (trust the EKS service) ──
module "eks_role" {
  source               = "../../modules/iam"
  name                 = "eks-cluster-role"
  assume_role_services = ["eks.amazonaws.com"]

  inline_policy_json = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["ec2:*", "eks:*"]
      Resource = "*"
    }]
  })
}

# ── The EKS cluster ──
module "eks" {
  source     = "../../modules/eks"
  name       = "lab-cluster"
  role_arn   = module.eks_role.role_arn
  subnet_ids = [aws_subnet.a.id, aws_subnet.b.id]
}
