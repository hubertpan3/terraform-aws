terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "test_server" {
  ami           = "ami-03920e719f7393223"
  instance_type = "t4g.small"
  tags = {
    Name = "testServer"
    type = "experimental"
    flag = "hi"
  }
}
