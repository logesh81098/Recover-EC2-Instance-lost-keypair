output "security-group-linix" {
  value = aws_security_group.Recover-EC2-instance-lost-keypair-linux-SG.id
}

output "security-group-windows" {
  value = aws_security_group.Recover-EC2-instance-lost-keypair-windows-SG.id
}