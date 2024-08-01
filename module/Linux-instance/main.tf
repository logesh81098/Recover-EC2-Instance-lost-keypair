###########################################################################################################################
#                                       Deploying Linux instance 
###########################################################################################################################
resource "aws_instance" "original-instance" {
  ami = var.ami-id
  instance_type = var.instance-type
  subnet_id = var.subnet-id
  vpc_security_group_ids = [var.security-group]
  key_name = var.key-pair
  associate_public_ip_address = true
  tags = {
    Name = "Original Instance"
  }
}

###########################################################################################################################
#                                Creating new secondary volume and attaching it
###########################################################################################################################
resource "aws_ebs_volume" "secondary-volume" {
  size = 10
  availability_zone = var.az1
  type = "gp3"
  tags = {
    Name = "Secondary-volume-linux"
  }
}

resource "aws_volume_attachment" "secondary-volume-attachement" {
  volume_id = aws_ebs_volume.secondary-volume.id
  instance_id = aws_instance.original-instance.id
  device_name = "/dev/sdh"
}

###########################################################################################################################
#                        Taking snaphot of root volume and creating volume from the snapshot
###########################################################################################################################
data "aws_instance" "linux-server" {
  instance_id = aws_instance.original-instance.id
}

resource "aws_ebs_snapshot" "root-volume-snapshot" {
  volume_id = element(data.aws_instance.linux-server.root_block_device.*.volume_id,0)
  tags = {
    Name = "Root volume-snapshot"
  }
}

resource "aws_ebs_volume" "copy-root-volume" {
  availability_zone = var.az1
  type = "gp2"
  snapshot_id = aws_ebs_snapshot.root-volume-snapshot.id
  tags = {
    Name = "Root volume Replica"
  }
}