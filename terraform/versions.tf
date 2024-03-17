# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.74.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.12.1"
    }
  }

  required_version = ">= 0.14"
}

