# Experiment: kinesis-basics

A single-shard Kinesis Data Stream (`events-stream`). Uses `modules/kinesis`.

## Run

```bash
cd experiments/kinesis-basics
./tf init && ./tf apply
../../scripts/awslocal.sh kinesis list-streams
../../scripts/awslocal.sh kinesis describe-stream-summary --stream-name events-stream
./tf destroy
```
