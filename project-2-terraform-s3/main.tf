terraform {
  required_version = ">= 1.2.0"

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

resource "aws_s3_bucket" "demo" {
  bucket = "wandy-terraform-s3-lab-862087104485"

  tags = {
    Name        = "wandy-terraform-demo"
    Environment = "lab"
    Project     = "aws-cloud-journey"
  }
}
