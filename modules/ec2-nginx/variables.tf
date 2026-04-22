variable "environment" {
  description = "Environment name"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "aws-cloud-journey"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ssh_cidrs" {
  description = "CIDR blocks allowed for SSH"
  type        = list(string)
}

variable "http_cidrs" {
  description = "CIDR blocks allowed for HTTP"
  type        = list(string)
}
