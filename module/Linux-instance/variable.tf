variable "instance-type" {
  default = "t3.micro"
}

variable "ami-id" {
  default = "ami-046d5130831576bbb"
}

variable "subnet-id" {
  default = {}
}

variable "security-group" {
  default = {}
}

variable "key-pair" {
  default = {}
}