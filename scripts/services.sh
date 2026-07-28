#!/usr/bin/env bash
# List the AWS services your running Floci currently emulates (and their state).
# Usage:  ./scripts/services.sh
set -euo pipefail

endpoint="${AWS_ENDPOINT_URL:-http://localhost:4566}"

curl -s "$endpoint/_localstack/health" \
  | python3 -c "
import sys, json
svc = json.load(sys.stdin).get('services', {})
print(f'{len(svc)} services available on Floci ($endpoint):\n')
for name in sorted(svc):
    print(f'  {name:<22} {svc[name]}')
"
