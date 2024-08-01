variable "ami-id" {
  default = "ami-046d5130831576bbb"
}

variable "instance-type" {
  default = "t3.micro"
}

variable "subnet-id" {
  default = {}
}

variable "security-group" {
  default = {}
}

variable "keypair" {
  default = {}
}