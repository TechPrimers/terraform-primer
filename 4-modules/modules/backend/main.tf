

# Create EC2
resource "aws_instance" "backend" {
  ami           = var.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "Backend-Example"
  }
}