
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ssh" {
  key_name   = format("my_ssh_key-%s", random_string.random_name.result)
  public_key = tls_private_key.ssh_key.public_key_openssh
}

# creating a resource of type aws_instance
resource "aws_instance" "app_server" {
  ami                    = var.aws_ec2_ami
  key_name               = aws_key_pair.ssh.key_name
  instance_type          = var.aws_ec2_instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  subnet_id              = aws_subnet.public-subnet.id
  user_data              = file("userdata.sh")
  tags = {
    module = "ec2-module-instance"
  }
}

output "public_ip" {
  value = aws_instance.app_server.public_ip
}
