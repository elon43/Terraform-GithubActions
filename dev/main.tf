module "vpc" {
  source = "../modules/vpc"

  cidr_block        = var.CIDR_BLOCK
  vpc_id            = module.vpc.vpc_id
  tenancy           = var.TENANCY
  cidr_block_subnet = var.CIDR_BLOCK_SUBNET
  name              = var.NAME
}

module "ec2" {
  module       = "../modules/ec2"
  ami          = var.AMI_ID
  instance_typ = var.INSTANCE_TYPE
  subnet_id    = var.SUBNET_ID
  name         = var.NAME
  region       = var.REGION
}