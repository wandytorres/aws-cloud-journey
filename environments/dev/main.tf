terraform {
  backend "s3" {
    bucket         = "wandy-terraform-state-862087104485"
    key            = "environments/dev/terraform.tfstate"
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

module "ec2_nginx" {
  source = "../../modules/ec2-nginx"

  environment   = "dev"
  instance_type = var.instance_type
  ssh_cidrs     = var.ssh_cidrs
  http_cidrs    = var.http_cidrs
}

output "public_ip" {
  value = module.ec2_nginx.public_ip
}

output "public_dns" {
  value = module.ec2_nginx.public_dns
}
