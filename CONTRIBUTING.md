# Contributing to Practice Terraform locally with Floci

Thank you for considering contributing to this repository! Contributions from the community help make this project a great resource for learning Terraform and AWS locally without cost or risk.

Please take a moment to review this document before submitting your contribution.

---

## Code of Conduct

By participating in this project, you agree to abide by our [Code of Conduct](file:///Users/sany/Projects/practice-terraform-in-local-with-floci/CODE_OF_CONDUCT.md). Please keep interactions civil, welcoming, and respectful.

---

## Getting Started

### Prerequisites

To develop and test contributions locally, make sure you have:

- **Docker** — for running the local Floci container (`docker run -d -p 4566:4566 --name floci floci/floci`).
- **Terraform** (`>= 1.0.0`) — installed locally.
- **AWS CLI** (`aws`) — for inspecting created resources.

### Local Environment Setup

1. **Fork and clone the repository:**
   ```bash
   git clone https://github.com/sany2k8/practice-terraform-in-local-with-floci.git
   cd practice-terraform-in-local-with-floci
   ```

2. **Verify Floci is running:**
   ```bash
   ./scripts/services.sh
   ```

---

## How to Contribute

We welcome various types of contributions, including:
- Adding new AWS service modules in `modules/`.
- Adding new learning experiments in `experiments/`.
- Improving existing modules, scripts, or documentation.
- Fixing bugs or formatting issues.

### 1. Adding a New Service Module

If a module for an AWS service doesn't exist under `modules/`, scaffold it using:

```bash
./scripts/new-service.sh <service-name>
```

This creates `modules/<service-name>/` with skeleton `.tf` files.

**Requirements for Modules:**
- `main.tf`: Define the AWS resources cleanly using descriptive identifiers.
- `variables.tf`: Declare variables with explicit types, clear descriptions, and sensible defaults (e.g. `recovery_window_in_days = 0` for dev/local instant cleanup).
- `outputs.tf`: Export useful resource attributes (ID, ARN, names, endpoints, etc.).
- `README.md`: Document what the module creates, input variables, outputs, and sample `./scripts/awslocal.sh` inspection commands.

### 2. Adding a New Experiment

To demonstrate a single service or an integration between services, scaffold an experiment using:

```bash
./scripts/new-experiment.sh <experiment-name>
```

**Requirements for Experiments:**
- Each experiment is its own isolated Terraform root directory in `experiments/`.
- Symlinks to `_shared/providers.tf`, `_shared/versions.tf`, and `scripts/tf` are automatically managed by `new-experiment.sh`.
- Update `main.tf` to instantiate the necessary module(s).
- Update `outputs.tf` to re-export helpful attributes.
- Update `README.md` with step-by-step instructions and verification commands.

---

## Coding Standards & Style Guide

- **Formatting:** Format all Terraform code using `terraform fmt` prior to committing:
  ```bash
  terraform fmt -recursive
  ```
- **Naming Conventions:**
  - Standard resource instances within a module should be named `this` (e.g., `aws_s3_bucket.this`, `aws_sqs_queue.this`).
  - Use lower_snake_case for variable names, output names, and resource identifiers.
- **Floci Compatibility:**
  - Avoid hardcoding real AWS endpoints or AWS account IDs.
  - Rely on the `./tf` wrapper script which sets `AWS_ENDPOINT_URL=http://localhost:4566`.
  - Do NOT add `endpoints {}` blocks inside `modules/` or experiment `main.tf` files.

---

## Pull Request Guidelines

1. **Create a Topic Branch:**
   ```bash
   git checkout -b feature/add-kms-module
   ```
2. **Test your changes locally:**
   Run `./tf init`, `./tf plan`, `./tf apply`, and `./tf destroy` inside your experiment directory to ensure clean execution and destruction.
3. **Commit your changes:**
   Use clear, descriptive commit messages:
   ```bash
   git commit -m "feat(modules): add secretsmanager module and secretsmanager-basics experiment"
   ```
4. **Push and open a Pull Request:**
   - Describe what your PR adds or fixes.
   - Mention any related issues.
   - Include sample output from `./tf apply` or `./scripts/awslocal.sh` verifying that it works against Floci.

---

Thank you for building better local Terraform practices with us!
