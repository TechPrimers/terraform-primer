variable "instance_type" {
    type = string
    description = "Denotes the instance type"
    default = "default.instance"
}

# Create EC2
resource "aws_instance" "web3" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  tags = local.tags
}