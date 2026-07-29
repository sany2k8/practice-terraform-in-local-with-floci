# Experiment: ecr-basics

An ECR repository (`my-app`, immutable tags, scan-on-push). Uses `modules/ecr`.

## Run

```bash
cd experiments/ecr-basics
./tf init && ./tf apply
../../scripts/awslocal.sh ecr describe-repositories
./tf destroy
```
