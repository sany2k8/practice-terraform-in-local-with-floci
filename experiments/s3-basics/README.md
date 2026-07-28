# Experiment: s3-basics

A versioned S3 bucket (with a sample `hello.txt` object), via `modules/s3`.

## Run

```bash
cd experiments/s3-basics
./tf init && ./tf apply
../../scripts/awslocal.sh s3 ls
../../scripts/awslocal.sh s3 ls s3://my-first-floci-bucket
./tf destroy
```
