resource "aws_security_group" "this" {
  name        = "${var.name_prefix}-sg"
  description = "Allow SSH inbound"
  vpc_id      = var.vpc_id

  ingress {
    description      = "SSH from anywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    description      = "All outbound"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}-sg"
  }
}

resource "aws_instance" "this" {
  count                  = 2
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = element(var.private_subnets, count.index % length(var.private_subnets))
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.this.id]
  associate_public_ip_address = false

  tags = {
    Name = "${var.name_prefix}-ec2-${count.index + 1}"
  }
}
