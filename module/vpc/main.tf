#############################################################################################################################
#                                             Deploying VPC
#############################################################################################################################
resource "aws_vpc" "recover-ec2-instance" {
  cidr_block = var.vpc-cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "Recover-EC2-instance-lost-keypair-VPC"
  }
}

#############################################################################################################################
#                                             Deploying Subnet
#############################################################################################################################
resource "aws_subnet" "public-subnet" {
  vpc_id = aws_vpc.recover-ec2-instance.id
  cidr_block = var.subnet-cidr
  availability_zone = var.az1
  tags = {
    Name = "Recover-EC2-instance-lost-keypair-Public-subnet"
  }
}

#############################################################################################################################
#                                          Deploying Internet Gateway
#############################################################################################################################
resource "aws_internet_gateway" "Recover-EC2-instance-lost-keypair-IGW" {
  vpc_id = aws_vpc.recover-ec2-instance.id
  tags = {
    Name = "Recover-EC2-instance-lost-keypair-IGW"
  }
}


#############################################################################################################################
#                                             Deploying Route Table
#############################################################################################################################
resource "aws_route_table" "Recover-EC2-instance-lost-keypair-RT" {
  vpc_id = aws_vpc.recover-ec2-instance.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Recover-EC2-instance-lost-keypair-IGW.id
  }
  tags = {
    Name = "Recover-EC2-instance-lost-keypair-RT"
  }
}

resource "aws_route_table_association" "Recover-EC2-instance-lost-keypair-RT-Association" {
  subnet_id = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.Recover-EC2-instance-lost-keypair-RT.id
}

