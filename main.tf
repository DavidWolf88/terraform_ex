provider "aws" {
  region = "eu-central-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "example1" {
  ami           = "ami-01c74b7d55cbb6e31"
  instance_type = "t2.micro"
  
  tags = {
    Name = "terraform-example"
  }
}
