# Experiment: logs-basics

A CloudWatch log group (`/myapp/api`, 14-day retention) with a log stream
(`app-1`). Uses `modules/logs`.

## Run

```bash
cd experiments/logs-basics
./tf init && ./tf apply
../../scripts/awslocal.sh logs describe-log-groups
../../scripts/awslocal.sh logs describe-log-streams --log-group-name /myapp/api
./tf destroy
```
