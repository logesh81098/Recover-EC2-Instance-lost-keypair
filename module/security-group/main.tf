#############################################################################################################################
#                                         Deploying Security Groups
############################################################################################################################
resource "aws_security_group" "Recover-EC2-instance-lost-keypair-linux-SG" {
  vpc_id = var.vpc-id
  name = "Recover-EC2-instance-lost-keypair-SG"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allowing SSH connection from Anywhere"
  }
  egress {
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "-1"
  }
  tags = {
    Name = "Recover-EC2-instance-lost-keypair-linux-SG"
  }
  }

  resource "aws_security_group" "Recover-EC2-instance-lost-keypair-windows-SG" {
    vpc_id = var.vpc-id
    name = "Recover-EC2-instance-lost-keypair-windows-SG"
    ingress {
        from_port = 3389
        to_port = 3389
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allowing RDP connection from Anywhere"
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "Recover-EC2-instance-lost-keypair-windows-SG"
    }
  }