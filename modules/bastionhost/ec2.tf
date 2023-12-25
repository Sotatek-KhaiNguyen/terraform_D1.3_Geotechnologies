resource "aws_instance" "bastion" {
  ami = "ami-079db87dc4c10ac91"
  instance_type = "t4g.nano"
  subnet_id = var.subnet_ids

  vpc_security_group_ids = [
    var.network_settings.security_group, aws_security_group.allow_ssh.id
  ]

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 50
  }

  tags = {
    Name = "${var.common.env}-${var.common.project}-bastion"
  }
}

resource "aws_security_group" "allow_ssh" {
    name = "${var.common.env}-${var.common.project}-bastion-ssh"
    vpc_id = var.network_settings.vpc_id

    ingress {
        from_port = "22"
        to_port = "22"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/24"]
    }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
