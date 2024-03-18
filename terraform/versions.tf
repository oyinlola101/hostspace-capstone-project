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
  backend "gcs" {
    bucket  = "ter-bucket"
    prefix  = "terraform/state"
    credentials = "C:/Users/oyin/Desktop/practice/service.json"

  }

  required_version = ">= 0.14"
}

