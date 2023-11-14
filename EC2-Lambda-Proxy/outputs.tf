output "vpc_id" {
  value = aws_vpc.stack-example-vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public-subnet.id
}

output "sg_id" {
  value = aws_security_group.allow_tls.id
}


resource "local_file" "aws_key" {
  content  = tls_private_key.ssh_key.private_key_pem
  filename = "my_ec2_key.pem"
}