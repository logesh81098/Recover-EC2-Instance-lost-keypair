output "vpc-id" {
  value = aws_vpc.recover-ec2-instance.id
}

output "subnet-id" {
  value = aws_subnet.public-subnet.id
}