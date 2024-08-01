output "secondary-root-volume" {
  value = aws_ebs_volume.copy-root-volume.id
}