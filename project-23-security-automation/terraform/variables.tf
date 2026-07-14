variable "aws_region" {
  description = "AWS Region used by the security automation laboratory"
  type        = string
  default     = "us-east-1"
}

variable "notification_email" {
  description = "Email that receives security notifications"
  type        = string
  default     = "wandytorres@gmail.com"
}
