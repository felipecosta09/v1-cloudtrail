terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.40.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
  }
  required_version = ">= 0.15.0"
    backend "s3" {
    bucket = "felipec-state-files"
    key    = "v1-cloudtrail/api-visibility/terraform.tfstate"
    region = "us-east-1"
    }
}

provider "aws" {
  region = var.aws_region
}
