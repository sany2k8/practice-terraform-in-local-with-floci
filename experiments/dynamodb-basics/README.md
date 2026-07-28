# Experiment: dynamodb-basics

A `PAY_PER_REQUEST` DynamoDB table with a `user_id` hash key, via `modules/dynamodb`.

## Run

```bash
cd experiments/dynamodb-basics
./tf init && ./tf apply
../../scripts/awslocal.sh dynamodb list-tables
../../scripts/awslocal.sh dynamodb describe-table --table-name users
./tf destroy
```
