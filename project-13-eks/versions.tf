terraform {
  required_version = ">= 1.2.0"

  backend "s3" {
    bucket         = "wandy-terraform-state-862087104485"
    key            = "project-13-eks/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
