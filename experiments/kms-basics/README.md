# Experiment: kms-basics

A customer-managed KMS key with the alias `alias/app-secrets`. Uses `modules/kms`.

## Run

```bash
cd experiments/kms-basics
./tf init && ./tf apply
../../scripts/awslocal.sh kms list-keys
../../scripts/awslocal.sh kms list-aliases
./tf destroy
```
