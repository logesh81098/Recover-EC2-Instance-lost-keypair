#############################################################################################################################
#                                         Recovery Keypair
#############################################################################################################################
resource "tls_private_key" "recovery-key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "recovery-keypair" {
  key_name = "Recovery-server-key"
  public_key = tls_private_key.recovery-key.public_key_openssh
}

resource "local_file" "recovery-key-pem" {
  content = tls_private_key.recovery-key.private_key_pem
  filename = "Recovery-server-pem"
}