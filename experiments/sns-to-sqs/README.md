# Experiment: sns-to-sqs

Fan-out: an SNS topic (`order-events`) delivers every published message into an
SQS queue (`jobs-queue`). Composes `modules/sns` + `modules/sqs`, plus a
subscription and a queue policy allowing SNS to deliver.

## Run

```bash
cd experiments/sns-to-sqs
./tf init && ./tf apply

# Publish a message to the topic...
../../scripts/awslocal.sh sns publish \
  --topic-arn arn:aws:sns:us-east-1:000000000000:order-events \
  --message '{"order_id":42,"status":"created"}'

# ...and receive it from the queue (arrives wrapped in an SNS envelope).
../../scripts/awslocal.sh sqs receive-message \
  --queue-url http://localhost:4566/000000000000/jobs-queue

./tf destroy
```
