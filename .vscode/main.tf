provider "aws" {
  version = "~> 2.0"
  region = "us-east-2"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-0a91cd140a1fc148a"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
      Name = "dev${count.index}"
  }
  vpc_security_group_ids = [ "sg-0a1bbce822171e81d" ]
}

resource "aws_security_group" "acesso-ssh" {
    name        = "acesso-ssh"
    description = "acesso-ssh"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["189.124.19.34/32"]
    }

    tags = {
        Name = "ssh"
    }
}