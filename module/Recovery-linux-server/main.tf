###########################################################################################################################
#                                      Recovery-Linux-Server
###########################################################################################################################
resource "aws_instance" "recovery-linux-server" {
  ami = var.ami-id
  instance_type = var.instance-type
  subnet_id = var.subnet-id
  vpc_security_group_ids = [var.security-group]
  key_name = var.keypair
  associate_public_ip_address = true
  tags = {
    Name = "Recovery-Linux-server"
  }
}