variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "wandy-ecs-alb"
}

variable "container_image" {
  type    = string
  default = "862087104485.dkr.ecr.us-east-1.amazonaws.com/wandy-docker-app:latest"
}

variable "container_port" {
  type    = number
  default = 3000
}

variable "cpu" {
  type    = number
  default = 256
}

variable "memory" {
  type    = number
  default = 512
}
variable "alert_email" {
  type        = string
  description = "Email address for CloudWatch alarm notifications"
}
