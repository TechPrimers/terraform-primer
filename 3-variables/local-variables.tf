terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Choosing the AMI name
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


locals {
    instance_type = "t3.micro"
    tags = {
    Name = "Terraform-Example"
  }
}

# Create EC2
resource "aws_instance" "web1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = local.instance_type
  tags = local.tags
}

resource "aws_instance" "web2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = local.instance_type
  tags = local.tags
}