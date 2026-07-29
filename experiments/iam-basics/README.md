# Experiment: iam-basics

An IAM role (`lambda-exec`) assumable by Lambda, with an inline policy allowing
CloudWatch Logs — the standard Lambda execution role. Uses `modules/iam`.

## Run

```bash
cd experiments/iam-basics
./tf init && ./tf apply
../../scripts/awslocal.sh iam get-role --role-name lambda-exec
../../scripts/awslocal.sh iam list-role-policies --role-name lambda-exec
./tf destroy
```
