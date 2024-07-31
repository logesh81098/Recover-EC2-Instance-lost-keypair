#############################################################################################################################
#                                           Deploying Key pair
#############################################################################################################################
resource "tls_private_key" "original-key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "original-key-pair" {
  public_key = tls_private_key.original-key.public_key_openssh
  key_name = "original-key"
}

resource "local_file" "original-key-pem" {
  filename = aws_key_pair.original-key-pair.key_name
  content = tls_private_key.original-key.private_key_pem
}