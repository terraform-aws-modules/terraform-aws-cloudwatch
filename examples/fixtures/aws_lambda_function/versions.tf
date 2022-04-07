terraform {
  required_version = ">= 0.13"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.55"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 2.0"
    }

    archive = {
      source  = "hashicorp/archive"
      version = ">= 2.0"
    }
  }
}
