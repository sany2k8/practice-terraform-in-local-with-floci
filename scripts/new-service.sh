#!/usr/bin/env bash
# Scaffold a new service module skeleton under ./modules/<service>.
# Fill in the real resources afterwards (or ask Claude / the
# `terraform-floci-service` skill to do it for you).
#
# Usage:  ./scripts/new-service.sh <service>
#   e.g.  ./scripts/new-service.sh sns
set -euo pipefail

svc="${1:-}"
if [[ -z "$svc" ]]; then
  echo "usage: $0 <service>   (e.g. sns, lambda, iam, kinesis)" >&2
  exit 1
fi

root="$(cd "$(dirname "$0")/.." && pwd)"
dir="$root/modules/$svc"

if [[ -d "$dir" ]]; then
  echo "module '$svc' already exists at $dir" >&2
  exit 1
fi

mkdir -p "$dir"

cat > "$dir/variables.tf" <<EOF
variable "name" {
  description = "Name for the $svc resource."
  type        = string
}

variable "tags" {
  description = "Tags to apply."
  type        = map(string)
  default     = {}
}
EOF

cat > "$dir/main.tf" <<EOF
# TODO: define the $svc resources for this module.
# Docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
EOF

cat > "$dir/outputs.tf" <<EOF
# TODO: expose the useful attributes of the $svc resources here.
EOF

cat > "$dir/README.md" <<EOF
# Module: $svc

TODO: describe what this module creates, its inputs, and its outputs.
EOF

echo "Created module skeleton: modules/$svc/"
echo
echo "Next steps:"
echo "  1. Fill in modules/$svc/{main,variables,outputs}.tf with real resources."
echo "  2. Create an experiment that uses it:"
echo "       ./scripts/new-experiment.sh $svc-basics"
echo "     then edit experiments/$svc-basics/main.tf:"
echo
echo "     module \"$svc\" {"
echo "       source = \"../../modules/$svc\""
echo "       name   = \"my-$svc\""
echo "     }"
echo
echo "  3. cd experiments/$svc-basics && ./tf init && ./tf apply"
