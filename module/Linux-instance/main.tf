###########################################################################################################################
#                                       Deploying Linux instance 
###########################################################################################################################
resource "aws_instance" "original-instance" {
  ami = var.ami-id
  instance_type = var.instance-type
  subnet_id = var.subnet-id
  security_groups = [var.security-group]
  key_name = var.key-pair
  associate_public_ip_address = true
  tags = {
    Name = "Original Instance"
  }
}