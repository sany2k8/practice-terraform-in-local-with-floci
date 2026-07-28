# Security Policy

## Overview

This repository (**Practice Terraform locally with Floci**) is designed specifically for **local development, learning, and testing** of AWS infrastructure using [Floci](https://floci.io) / LocalStack on `localhost:4566`.

---

## Reporting a Vulnerability

We take security seriously and appreciate responsible disclosure of any vulnerabilities found within this codebase, scripts, or module patterns.

### How to Report

If you discover a security issue or vulnerability (such as unintended exposure of secrets, dangerous shell script practices, or insecure configuration defaults):

1. **Do NOT open a public GitHub issue** for undisclosed security vulnerabilities.
2. Please report the issue privately by emailing the maintainer or using GitHub's **Private Vulnerability Reporting** feature on this repository.
3. Include as much detail as possible:
   - A description of the issue.
   - Steps to reproduce or proof-of-concept code.
   - Potential impact of the vulnerability.

### Response Timeline

- **Acknowledgement:** We aim to acknowledge receipt of security reports within **48 hours**.
- **Assessment & Fix:** We will evaluate the report and work on a fix promptly, providing updates to the reporter as progress is made.

---

## Security Best Practices for this Repository

### 1. No Real AWS Credentials Required
This repository is pre-configured to interact exclusively with a local AWS emulator (Floci/LocalStack).
- The shared provider config in `experiments/_shared/providers.tf` uses mock credentials (`access_key = "test"`, `secret_key = "test"`).
- **Never commit real AWS credentials, tokens, or secret keys** to this repository.

### 2. Sensitive Terraform Variables
When defining variables that handle secret data (passwords, tokens, private keys):
- Always set `sensitive = true` on the variable definition in `variables.tf`.
- Keep default values safe for local testing only (e.g. `dbpassword123!`).

### 3. Shell Script Safety
All automation scripts in `scripts/` must adhere to strict bash execution settings (`set -euo pipefail`) to prevent unintended execution flow or unhandled command failures.
