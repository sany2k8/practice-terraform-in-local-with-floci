# Module: ecs

Creates an ECS cluster and a task definition (EC2 launch type, bridge networking
— no VPC or execution role required, to keep the lab simple).

## Usage

```hcl
module "ecs" {
  source          = "../../modules/ecs"
  cluster_name    = "app-cluster"
  family          = "web"
  container_image = "nginx:latest"
  container_port  = 80
}
```

## Inputs

| Name              | Type          | Default          | Description                       |
|-------------------|---------------|------------------|-----------------------------------|
| `cluster_name`    | `string`      | —                | Cluster name (required).          |
| `family`          | `string`      | —                | Task definition family (required).|
| `container_name`  | `string`      | `"app"`          | Container name.                   |
| `container_image` | `string`      | `"nginx:latest"` | Image to run.                     |
| `container_port`  | `number`      | `80`             | Container port.                   |
| `cpu`             | `number`      | `256`            | CPU units.                        |
| `memory`          | `number`      | `512`            | Memory (MiB).                     |
| `tags`            | `map(string)` | `{}`             | Tags.                             |

## Outputs

| Name                  | Description                        |
|-----------------------|------------------------------------|
| `cluster_name`        | Cluster name.                      |
| `cluster_arn`         | Cluster ARN.                       |
| `task_definition_arn` | Task definition ARN (with revision).|

## Inspect on Floci

```bash
./scripts/awslocal.sh ecs list-clusters
./scripts/awslocal.sh ecs describe-clusters --clusters app-cluster
./scripts/awslocal.sh ecs list-task-definitions
```
