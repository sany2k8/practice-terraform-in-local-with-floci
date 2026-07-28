# Practice Terraform locally with Floci

Learn Terraform + AWS with **zero cost and no AWS account**, using
[Floci](https://floci.io) (a local, open-source AWS emulator) on port `4566`.

Two-layer design so you can experiment with **any of Floci's ~70 free services**,
one at a time, without provider changes:

- **`modules/`** — reusable building blocks, one folder per AWS service.
- **`experiments/`** — a separate Terraform root per experiment, each reusing the
  modules. Apply and destroy each one independently.

## Prerequisites

- Floci running in Docker: `docker ps` → container `floci`, port `4566`
- Terraform: `terraform version`
- AWS CLI: `aws --version`

## How the Floci wiring works

Every AWS call is redirected to Floci by the `AWS_ENDPOINT_URL` environment
variable — so there's **no `endpoints {}` block** and using a new service needs
**zero provider changes**. The `./tf` script in each experiment sets it for you.

## Layout

```
modules/                     # reusable, one folder per service
  s3/  dynamodb/  sqs/  sns/  # each: main.tf variables.tf outputs.tf README.md
experiments/                 # each subfolder is its OWN terraform root
  _shared/                   # providers.tf + versions.tf (symlinked into each)
  s3-basics/                 # module "s3"
  dynamodb-basics/           # module "dynamodb"
  sqs-basics/                # module "sqs"
  sns-to-sqs/                # module "sns" + "sqs" wired for fan-out
scripts/
  tf  awslocal.sh  new-service.sh  new-experiment.sh  services.sh
```

> Why separate directories? Terraform merges *all* `.tf` files in one directory
> and applies them together. Giving each experiment its own root means one `apply`
> touches only that experiment — and its state is isolated.

## Run an existing experiment

```bash
cd experiments/sns-to-sqs     # pick any experiment
./tf init                     # ./tf is a symlink to scripts/tf (sets AWS_ENDPOINT_URL)
./tf plan                     # to see what will be created
./tf apply                    # to create the resources
./tf destroy                  # to destroy the resources
```

Inspect what got created (from anywhere): to find the name of the resources, you can use the following commands:

List service keys in AWS:
```bash
./scripts/services.sh
```

List resources in a service:
```bash
./scripts/awslocal.sh s3 ls
./scripts/awslocal.sh dynamodb list-tables
./scripts/awslocal.sh sqs list-queues
./scripts/awslocal.sh sns list-topics
```

Each experiment's own `README.md` has its specific run/verify commands (e.g.
`sns-to-sqs` shows how to publish a message and receive it from the queue).

---

# Experiment with ANY of Floci's ~70 free services

Everything Floci emulates is free, unlimited, and local. There's **no pre-built
module for every service** — you add the ones you want, when you want them.

## See what's available first

```bash
./scripts/services.sh                               # pretty list of live services
curl -s http://localhost:4566/_localstack/health    # raw JSON
```

Full catalog also at https://floci.io/aws/#services.

## How to add a new service/experiment (two commands + fill in the blanks)

```bash
# 1. Scaffold a reusable module for the service
./scripts/new-service.sh kms
#    → fill in modules/kms/main.tf (aws_kms_key, ...) + variables/outputs/README
#    docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# 2. Scaffold an experiment root that uses it
./scripts/new-experiment.sh kms-basics
#    → edit experiments/kms-basics/main.tf:
#         module "kms" {
#           source = "../../modules/kms"
#           name   = "my-key"
#         }

# 3. Apply just this experiment
cd experiments/kms-basics && ./tf init && ./tf apply
../../scripts/awslocal.sh kms list-keys
```

`new-experiment.sh` wires up the `providers.tf`/`versions.tf`/`tf` symlinks for
you, so an experiment is ready to run immediately.

### The rules

- **One service = one module**; keep each module focused on its own service.
- **Never** put a `provider` block, `endpoints`, or credentials inside a module —
  they inherit the shared Floci provider.
- **Cross-service wiring** (e.g. SNS→SQS) goes in the *experiment* root that
  composes the modules, not inside a module.
- **One experiment per service/scenario**, named for what it demonstrates.

---

# Service catalog (all ~70, free on Floci)

Look up exact resource arguments in the
[AWS provider docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
(search the "Terraform resource" name). The **service key** is what appears in
`./scripts/services.sh` and what you pass to `./scripts/awslocal.sh <key> ...`.

### Compute & Containers
| Service key | AWS service | Example Terraform resource |
|-------------|-------------|----------------------------|
| `ec2` | EC2 | `aws_instance`, `aws_vpc`, `aws_security_group` |
| `lambda` | Lambda | `aws_lambda_function` |
| `ecs` | Elastic Container Service | `aws_ecs_cluster`, `aws_ecs_service` |
| `ecr` | Elastic Container Registry | `aws_ecr_repository` |
| `eks` | Elastic Kubernetes Service | `aws_eks_cluster` |
| `batch` | AWS Batch | `aws_batch_job_queue` |
| `autoscaling` | EC2 Auto Scaling | `aws_autoscaling_group` |
| `elasticbeanstalk` | Elastic Beanstalk | `aws_elastic_beanstalk_application` |
| `lightsail` | Lightsail | `aws_lightsail_instance` |
| `elasticloadbalancing` | ELB / ALB / NLB | `aws_lb`, `aws_lb_target_group` |

### Storage
| Service key | AWS service | Example Terraform resource |
|-------------|-------------|----------------------------|
| `s3` | S3 | `aws_s3_bucket` |
| `s3vectors` | S3 Vectors | `aws_s3vectors_*` |
| `backup` | AWS Backup | `aws_backup_vault`, `aws_backup_plan` |
| `transfer` | Transfer Family | `aws_transfer_server` |

### Databases
| Service key | AWS service | Example Terraform resource |
|-------------|-------------|----------------------------|
| `dynamodb` | DynamoDB | `aws_dynamodb_table` |
| `rds` / `rds-data` | RDS (+ Data API) | `aws_db_instance` |
| `docdb` | DocumentDB | `aws_docdb_cluster` |
| `neptune` | Neptune | `aws_neptune_cluster` |
| `elasticache` | ElastiCache | `aws_elasticache_cluster` |
| `memorydb` | MemoryDB | `aws_memorydb_cluster` |

### Messaging & Integration
| Service key | AWS service | Example Terraform resource |
|-------------|-------------|----------------------------|
| `sqs` | SQS | `aws_sqs_queue` |
| `sns` | SNS | `aws_sns_topic`, `aws_sns_topic_subscription` |
| `events` | EventBridge | `aws_cloudwatch_event_rule`, `aws_cloudwatch_event_bus` |
| `scheduler` | EventBridge Scheduler | `aws_scheduler_schedule` |
| `pipes` | EventBridge Pipes | `aws_pipes_pipe` |
| `states` | Step Functions | `aws_sfn_state_machine` |
| `mq` | Amazon MQ | `aws_mq_broker` |
| `kafka` | MSK (Managed Kafka) | `aws_msk_cluster` |
| `appsync` | AppSync (GraphQL) | `aws_appsync_graphql_api` |
| `apigateway` | API Gateway (REST) | `aws_api_gateway_rest_api` |
| `apigatewayv2` | API Gateway (HTTP/WS) | `aws_apigatewayv2_api` |
| `servicediscovery` | Cloud Map | `aws_service_discovery_service` |

### Streaming & Analytics
| Service key | AWS service | Example Terraform resource |
|-------------|-------------|----------------------------|
| `kinesis` | Kinesis Data Streams | `aws_kinesis_stream` |
| `firehose` | Kinesis Data Firehose | `aws_kinesis_firehose_delivery_stream` |
| `glue` | Glue | `aws_glue_catalog_database` |
| `athena` | Athena | `aws_athena_database`, `aws_athena_workgroup` |
| `es` | OpenSearch/Elasticsearch | `aws_opensearch_domain` |
| `elasticmapreduce` | EMR | `aws_emr_cluster` |

### Security, Identity & Compliance
| Service key | AWS service | Example Terraform resource |
|-------------|-------------|----------------------------|
| `iam` | IAM | `aws_iam_role`, `aws_iam_policy`, `aws_iam_user` |
| `kms` | KMS | `aws_kms_key`, `aws_kms_alias` |
| `secretsmanager` | Secrets Manager | `aws_secretsmanager_secret` |
| `acm` | Certificate Manager | `aws_acm_certificate` |
| `cognito-idp` | Cognito User Pools | `aws_cognito_user_pool` |
| `wafv2` | WAF v2 | `aws_wafv2_web_acl` |

### Developer Tools & IaC
| Service key | AWS service | Example Terraform resource |
|-------------|-------------|----------------------------|
| `codebuild` | CodeBuild | `aws_codebuild_project` |
| `codedeploy` | CodeDeploy | `aws_codedeploy_app` |
| `codepipeline` | CodePipeline | `aws_codepipeline` |
| `cloudformation` | CloudFormation | `aws_cloudformation_stack` |
| `cloudcontrol` | Cloud Control API | `aws_cloudcontrolapi_resource` |

### Management & Monitoring
| Service key | AWS service | Example Terraform resource |
|-------------|-------------|----------------------------|
| `monitoring` | CloudWatch (metrics/alarms) | `aws_cloudwatch_metric_alarm` |
| `logs` | CloudWatch Logs | `aws_cloudwatch_log_group` |
| `ssm` | Systems Manager | `aws_ssm_parameter` |
| `cloudtrail` | CloudTrail | `aws_cloudtrail` |
| `config` | AWS Config | `aws_config_config_rule` |
| `appconfig` / `appconfigdata` | AppConfig | `aws_appconfig_application` |
| `tagging` | Resource Groups Tagging | (used via `tags` on resources) |

### Networking & Content Delivery
| Service key | AWS service | Example Terraform resource |
|-------------|-------------|----------------------------|
| `route53` | Route 53 | `aws_route53_zone`, `aws_route53_record` |
| `cloudfront` | CloudFront (CDN) | `aws_cloudfront_distribution` |

### AI / ML
| Service key | AWS service | Example Terraform resource |
|-------------|-------------|----------------------------|
| `bedrock-runtime` | Bedrock Runtime | (runtime API — invoke, less TF) |
| `textract` | Textract | (runtime API) |
| `transcribe` | Transcribe | (runtime API) |

### IoT
| Service key | AWS service | Example Terraform resource |
|-------------|-------------|----------------------------|
| `iot` / `iotdata` | IoT Core | `aws_iot_thing`, `aws_iot_topic_rule` |

### Email & Messaging
| Service key | AWS service | Example Terraform resource |
|-------------|-------------|----------------------------|
| `email` | SES | `aws_ses_email_identity`, `aws_ses_domain_identity` |

### Billing & Cost
| Service key | AWS service | Example Terraform resource |
|-------------|-------------|----------------------------|
| `ce` | Cost Explorer | (mostly read APIs) |
| `cur` | Cost & Usage Report | `aws_cur_report_definition` |
| `pricing` | Pricing API | (read API) |
| `bcm-data-exports` | Billing Data Exports | (read/config API) |

> Some services (e.g. `bedrock-runtime`, `textract`, `transcribe`, `pricing`,
> `ce`) are primarily runtime/read APIs with little to provision via Terraform —
> still fun to poke at with `./scripts/awslocal.sh <key> ...`.

## Ideas to practice next

- IAM role + policy (`iam`)
- Lambda triggered by the queue (`lambda` + `sqs`)
- A second queue subscribed to the same topic — true multi-consumer fan-out
- Kinesis stream + Firehose to S3 (`kinesis` + `firehose` + `s3`)
- Secrets Manager secret encrypted with a KMS key (`secretsmanager` + `kms`)
- Step Functions state machine (`states`)
