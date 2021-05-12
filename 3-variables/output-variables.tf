output "image_id" {
    value = data.aws_ami.ubuntu.id
    description = "Image ID for AMI"
    sensitive = false
    depends_on = [
        aws_instance.web1
    ]
}
