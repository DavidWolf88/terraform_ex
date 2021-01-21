provider "aws" {
  region = "eu-central-1"
  access_key = "AKIAZU4TL2OPOCFEFDNX"
  secret_key = "vxX0T+2kOWnU8z21FWMOzP+tiX0Ryny3XdrNVqPg"
}

resource "aws_instance" "example1" {
  ami           = "ami-01c74b7d55cbb6e31"
  instance_type = "t2.micro"
  
  tags = {
    Name = "terraform-example"
  }
}
