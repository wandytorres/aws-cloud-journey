variable "instance_type" {
  type = string
}

variable "ssh_cidrs" {
  type = list(string)
}

variable "http_cidrs" {
  type = list(string)
}
