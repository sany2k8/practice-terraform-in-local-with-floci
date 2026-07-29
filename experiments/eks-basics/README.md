# Experiment: eks-basics

A managed Kubernetes (EKS) control plane (`lab-cluster`). Creates the supporting
VPC + two subnets and a control-plane IAM role, then the cluster via `modules/eks`
(role from `modules/iam`).

> The VPC/subnets live in this experiment's `main.tf` because they're supporting
> infrastructure specific to this scenario, not a reusable service module. The IAM
> role is simplified for the lab (Floci doesn't enforce the real managed policies).

## Run

```bash
cd experiments/eks-basics
./tf init && ./tf apply
../../scripts/awslocal.sh eks list-clusters
../../scripts/awslocal.sh eks describe-cluster --name lab-cluster
./tf destroy
```
