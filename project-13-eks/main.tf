data "aws_vpc" "default" {
  default = true
}

data "aws_availability_zones" "available" {
  state = "available"

  exclude_names = ["us-east-1e"]
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  filter {
    name   = "availability-zone"
    values = data.aws_availability_zones.available.names
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.31"

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = false

  enable_cluster_creator_admin_permissions = true

  subnet_ids = data.aws_subnets.default.ids
  vpc_id     = data.aws_vpc.default.id

  eks_managed_node_groups = {
    default = {
      desired_size = var.desired_size
      max_size     = var.max_size
      min_size     = var.min_size

      instance_types = [var.node_instance_type]
    }
  }
}
