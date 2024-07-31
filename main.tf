module "vpc" {
  source = "./module/vpc"
}

module "security-group" {
  source = "./module/security-group"
  vpc-id = module.vpc.vpc-id
}
module "keypair" {
  source = "./module/keypair"
}

module "linux-instance" {
  source = "./module/Linux-instance"
  security-group = module.security-group.security-group-linix
  subnet-id = module.vpc.subnet-id
  key-pair = module.keypair.key-name
}