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

module "recovery-keypair" {
  source = "./module/Recovery-keypair"
}

module "recovery-linux-server" {
  source = "./module/Recovery-linux-server"
  subnet-id = module.vpc.subnet-id
  security-group = module.security-group.security-group-linix
  keypair = module.recovery-keypair.recovery-key
  replica-root-volume = module.linux-instance.secondary-root-volume
}