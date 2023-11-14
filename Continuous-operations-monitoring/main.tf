
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ssh" {
  key_name   = format("my_ssh_key-%s", random_string.random_name.result)
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.ec2.id
  depends_on = [aws_iam_role.ec2]
}


# creating a resource of type aws_instance
resource "aws_instance" "app_server" {
  ami                    = var.aws_ec2_ami
  key_name               = aws_key_pair.ssh.key_name
  instance_type          = var.aws_ec2_instance_type
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  subnet_id              = aws_subnet.public-subnet.id
  user_data              = file("userdata.sh")
  tags = {
    module = "ec2-module-instance"
  }
 

  provisioner "file" {
    source      = "headless"
    destination = "/tmp/"

     connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = tls_private_key.ssh_key.private_key_pem
      host        = aws_instance.app_server.public_ip
      timeout     = "5m"
      agent       = false
  }
  }
    provisioner "file" {
    source      = "gui"
    destination = "/tmp/"

     connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = tls_private_key.ssh_key.private_key_pem
      host        = aws_instance.app_server.public_ip
      timeout     = "5m"
      agent       = false
  }
  }
}


output "public_ip" {
  value = aws_instance.app_server.public_ip
}
