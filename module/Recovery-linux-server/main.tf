############################################################################################################################
#                                           Recovery-Linux-Server
############################################################################################################################
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

#############################################################################################################################
#                                      Attaching replica root volume
#############################################################################################################################
resource "aws_volume_attachment" "replica-root-volume" {
  volume_id = var.replica-root-volume
  instance_id = aws_instance.recovery-linux-server.id
  device_name = "/dev/sdh"
}