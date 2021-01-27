provider "aws" {
  region = "eu-central-1"
}
resource "aws_instance" "example1" {
  ami           = "ami-01c74b7d55cbb6e31"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello moooooossss" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF

  tags = {
    Name = "terraform-example"
  }
}
resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
   from_port   = var.server_port
   to_port     = var.server_port
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

output "public_ip" {
  value       = aws.instance.example.public_ip
  description = "The public IP address of the web server"
}