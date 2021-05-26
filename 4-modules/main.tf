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

module "frontend" {
  source = "./modules/frontend"
}

module "backend" {
  source = "./modules/backend"
  image_id = module.frontend.image_id
}