# Experiment: ssm-basics

Two SSM Parameter Store entries — a plain `String` (`/myapp/db/host`) and an
encrypted `SecureString` (`/myapp/db/password`). Uses `modules/ssm` twice.

## Run

```bash
cd experiments/ssm-basics
./tf init && ./tf apply
../../scripts/awslocal.sh ssm get-parameter --name /myapp/db/host
../../scripts/awslocal.sh ssm get-parameter --name /myapp/db/password --with-decryption
./tf destroy
```
