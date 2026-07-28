#!/usr/bin/env bash
# Create a new, self-contained experiment directory that reuses the shared
# provider config and the modules/ library. Each experiment is its own Terraform
# root, so you can apply/destroy it independently of the others.
#
# Usage:  ./scripts/new-experiment.sh <name>
#   e.g.  ./scripts/new-experiment.sh sns-to-sqs
set -euo pipefail

name="${1:-}"
if [[ -z "$name" ]]; then
  echo "usage: $0 <name>   (e.g. s3-basics, lambda-sqs)" >&2
  exit 1
fi

root="$(cd "$(dirname "$0")/.." && pwd)"
dir="$root/experiments/$name"

if [[ -d "$dir" ]]; then
  echo "experiment '$name' already exists at $dir" >&2
  exit 1
fi

mkdir -p "$dir"

# Symlink the shared provider config and the tf wrapper into the experiment.
ln -s ../_shared/providers.tf "$dir/providers.tf"
ln -s ../_shared/versions.tf  "$dir/versions.tf"
ln -s ../../scripts/tf        "$dir/tf"

service_name="${name%%-*}"
if [[ -d "$root/modules/$service_name" ]]; then
  module_source="../../modules/$service_name"
else
  module_source="../../modules/<module-name>"
fi

cat > "$dir/main.tf" <<EOF
# Experiment: $name
# Instantiate one or more modules from ../../modules/ here. Example:
#
# module "$service_name" {
#   source = "$module_source"
#   name   = "$name"
# }
EOF

cat > "$dir/outputs.tf" <<EOF
# Re-export anything useful from the modules above, e.g.:
# output "id" { value = module.$service_name.id }
EOF

cat > "$dir/README.md" <<EOF
# Experiment: $name

TODO: describe what this experiment demonstrates.

## Run

\`\`\`bash
cd experiments/$name
./tf init
./tf apply
# ... inspect with ../../scripts/awslocal.sh ...
./tf destroy
\`\`\`
EOF

echo "Created experiment: experiments/$name/"
echo "  providers.tf -> _shared/providers.tf (symlink)"
echo "  versions.tf  -> _shared/versions.tf  (symlink)"
echo "  tf           -> ../../scripts/tf     (symlink)"
echo
echo "Next: edit experiments/$name/main.tf to instantiate modules, then:"
echo "  cd experiments/$name && ./tf init && ./tf apply"
