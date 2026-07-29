# Experiment: ecs-basics

An ECS cluster (`app-cluster`) plus an nginx task definition (`web`). Uses
`modules/ecs`. EC2 launch type + bridge networking, so no VPC/execution role
is needed.

## Run

```bash
cd experiments/ecs-basics
./tf init && ./tf apply
../../scripts/awslocal.sh ecs describe-clusters --clusters app-cluster
../../scripts/awslocal.sh ecs list-task-definitions
./tf destroy
```
