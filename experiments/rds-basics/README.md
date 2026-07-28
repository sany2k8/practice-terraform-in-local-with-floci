# Experiment: rds-basics

Demonstrates creating a basic RDS DB Instance using the `rds` module.

## Run

```bash
cd experiments/rds-basics
./tf init
./tf apply
../../scripts/awslocal.sh rds describe-db-instances
./tf destroy
```

