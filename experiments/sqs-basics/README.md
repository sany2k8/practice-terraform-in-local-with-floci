# Experiment: sqs-basics

A standard SQS queue, via `modules/sqs`.

## Run

```bash
cd experiments/sqs-basics
./tf init && ./tf apply
../../scripts/awslocal.sh sqs list-queues
./tf destroy
```
