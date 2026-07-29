# Scripts Overview

This directory contains helper scripts and wrappers designed to simplify working with local Terraform setups and Floci (AWS emulator).

## Available Scripts

* **[awslocal.sh](awslocal.sh)**: Thin wrapper around the AWS CLI (`aws`). Configures default test credentials (`AWS_ACCESS_KEY_ID=test`, `AWS_SECRET_ACCESS_KEY=test`) and directs all AWS CLI commands to the local Floci emulator endpoint (`http://localhost:4566`).
  * **Usage**: `./scripts/awslocal.sh s3 ls`

* **[new-experiment.sh](new-experiment.sh)**: Automates the setup of a new isolated experiment in `experiments/<name>`. Creates symlinks for shared configuration (`providers.tf`, `versions.tf`) and the `tf` wrapper, while scaffolding `main.tf`, `outputs.tf`, and `README.md`.
  * **Usage**: `./scripts/new-experiment.sh <experiment-name>`

* **[new-service.sh](new-service.sh)**: Scaffolds a new service module skeleton under `modules/<service>`, generating default starting files (`variables.tf`, `main.tf`, `outputs.tf`, `README.md`).
  * **Usage**: `./scripts/new-service.sh <service-name>`

* **[services.sh](services.sh)**: Queries the local Floci health check endpoint (`http://localhost:4566/_localstack/health`) to display available emulated AWS services and their running status.
  * **Usage**: `./scripts/services.sh`

* **[tf](tf)**: Wrapper around the `terraform` CLI that sets environment variables (`AWS_ENDPOINT_URL`, test credentials, region) to ensure Terraform targets the local Floci instance safely.
  * **Usage**: `cd experiments/<experiment-name> && ./tf init && ./tf apply`
