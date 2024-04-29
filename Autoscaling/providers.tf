# Terraform Providers
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.47.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
