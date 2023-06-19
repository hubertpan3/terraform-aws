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

data "aws_ami" "latest_aws_arm_linux" {
  most_recent = true
  owners = ["137112412989"]

  filter {
    name = "name"
    values = ["al2023-ami-2023.*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "test_server" {
  ami           = data.aws_ami.latest_aws_arm_linux.id
  instance_type = "t4g.small"
  tags = {
    Name = "testServer"
    type = "experimental"
    flag = "hi"
    deploy = var.deployment_tag
  }
}

resource "aws_instance" "optional_server" {
  count = var.include_optional ? 1 : 0
  ami = data.aws_ami.latest_aws_arm_linux.id
  instance_type = "t4g.small"
  tags = {
    Name = "optionalServer"
    type = "experimental"
    flag = "hi"
    deploy = var.deployment_tag
  }
}
