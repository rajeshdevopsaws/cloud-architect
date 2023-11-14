
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.0.0/24"
}


variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [{
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }]
}


variable "egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }]
}

variable "vpc_id" {
  type    = string
  default = "hello"
}

variable "vpc_security_group_ids" {
  type    = string
  default = "sg-0e3e2b7e7e0b3b2d1"
}

variable "public_subnet" {
  type    = string
  default = "subnet-0e3e2b7e7e0b3b2d1"
}

variable "aws_ec2_ami" {
  type    = string
  default = "ami-03d5c68bab01f3496"
}

variable "aws_ec2_instance_type" {
  type    = string
  default = "t2.micro"
}
  