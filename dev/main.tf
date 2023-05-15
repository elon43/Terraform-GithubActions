module "vpc" {
  source = "../modules/vpc"

  CIDR_BLOCK       = var.CIDR_BLOCK
#  vpc_id            = module.vpc.vpc_id
  TENANCY           = var.TENANCY
  CIDR_BLOCK_SUBNET = var.CIDR_BLOCK_SUBNET
  NAME              = var.NAME
}

/*
module "ec2" {
  source       = "../modules/ec2"
  ami          = var.AMI_ID
  instance_typ = var.INSTANCE_TYPE
  subnet_id    = var.SUBNET_ID
  name         = var.NAME
  region       = var.REGION
}
*/