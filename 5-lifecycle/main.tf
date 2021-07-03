terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer-cli"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}
resource "aws_iam_access_key" "lb" {
  user = aws_iam_user.lb.name

  lifecycle {
    create_before_destroy = true
    prevent_destroy = true
  }
}


resource "aws_iam_user_policy" "lb_ro" {
  name = "describe-all"
  user = aws_iam_user.lb.name

  lifecycle {
    ignore_changes = [
      policy
    ]
  }

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}