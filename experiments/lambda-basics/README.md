# Experiment: lambda-basics

A Python 3.12 Lambda (`hello`) packaged from `src/handler.py`, with its IAM
execution role. Composes `modules/iam` + `modules/lambda`.

## Run

```bash
cd experiments/lambda-basics
./tf init && ./tf apply
../../scripts/awslocal.sh lambda list-functions
# Invoke it:
../../scripts/awslocal.sh lambda invoke --function-name hello --payload '{"name":"world"}' /tmp/out.json
cat /tmp/out.json
./tf destroy
```

> Note: invocation requires Floci to execute the runtime (it uses Docker under the
> hood). If invoke isn't supported in your Floci build, the function is still
> created — verify with `lambda get-function --function-name hello`.
