# This module also needs the archive provider (to zip the source directory).
# Declaring it here makes `terraform init` fetch it for any experiment that uses
# this module — no change needed in the shared versions.tf.
terraform {
  required_providers {
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.0"
    }
  }
}
