variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "wandy-bluegreen"
}

variable "blue_image" {
  type    = string
  default = "862087104485.dkr.ecr.us-east-1.amazonaws.com/wandy-docker-app:latest"
}

variable "green_image" {
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

variable "blue_desired_count" {
  type    = number
  default = 0
}

variable "green_desired_count" {
  type    = number
  default = 1
}

variable "blue_weight" {
  type    = number
  default = 0
}

variable "green_weight" {
  type    = number
  default = 100
}
