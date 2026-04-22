data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_security_group" "nginx_sg" {
  name        = "${var.environment}-nginx-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidrs
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.http_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-nginx-sg"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_instance" "nginx_server" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = data.aws_subnets.default.ids[0]
  vpc_security_group_ids      = [aws_security_group.nginx_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y nginx
              systemctl enable nginx
              systemctl start nginx
              cat > /usr/share/nginx/html/index.html <<'HTML'
              <html>
                <head><title>${var.environment} - Wandy EC2 Nginx Lab</title></head>
                <body style="font-family: Arial; text-align: center; margin-top: 50px;">
                  <h1>🚀 ${var.environment} EC2 + Nginx with Terraform</h1>
                  <h2>Wandy DevOps Journey</h2>
                  <p>Project running on AWS EC2</p>
                </body>
              </html>
              HTML
              EOF

  tags = {
    Name        = "${var.environment}-nginx-server"
    Environment = var.environment
    Project     = var.project_name
  }
}
