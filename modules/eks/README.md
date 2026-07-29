# Module: eks

Creates an EKS (managed Kubernetes) cluster control plane. Requires an IAM role
(trust `eks.amazonaws.com`) and at least two subnets — the experiment that uses
this module provides that supporting VPC/IAM infrastructure.

## Usage

```hcl
module "eks" {
  source     = "../../modules/eks"
  name       = "lab-cluster"
  role_arn   = aws_iam_role.eks.arn
  subnet_ids = [aws_subnet.a.id, aws_subnet.b.id]
}
```

## Inputs

| Name          | Type           | Default | Description                              |
|---------------|----------------|---------|------------------------------------------|
| `name`        | `string`       | —       | Cluster name (required).                 |
| `role_arn`    | `string`       | —       | Control-plane role ARN (required).       |
| `subnet_ids`  | `list(string)` | —       | At least two subnet IDs (required).      |
| `k8s_version` | `string`       | `null`  | Kubernetes version (default if null).    |
| `tags`        | `map(string)`  | `{}`    | Tags applied to the cluster.             |

## Outputs

| Name           | Description                     |
|----------------|---------------------------------|
| `cluster_name` | Cluster name.                   |
| `cluster_arn`  | Cluster ARN.                    |
| `endpoint`     | Kubernetes API endpoint.        |
| `status`       | Cluster status.                 |

## Inspect on Floci

```bash
./scripts/awslocal.sh eks list-clusters
./scripts/awslocal.sh eks describe-cluster --name lab-cluster
```
