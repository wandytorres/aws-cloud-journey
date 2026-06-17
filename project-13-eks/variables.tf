variable "cluster_name" {
  default = "wandy-eks-cluster"
}

variable "node_instance_type" {
  default = "t3.medium"
}

variable "desired_size" {
  default = 2
}

variable "max_size" {
  default = 2
}

variable "min_size" {
  default = 1
}
