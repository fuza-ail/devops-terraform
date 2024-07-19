variable "intance_type" {
  description = "ec2 instance type"
  type = string
  default = "t2.micro"  
}

variable "ami_id" {
  description = "ami"
  type = string
  default = "ami-0c185732ad1b6169b"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example_terraform" {
  ami = var.ami_id
  instance_type = var.intance_type

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
}