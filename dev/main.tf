module "vpc" {
  source = "../modules/vpc"

  CIDR_BLOCK       = var.CIDR_BLOCK
  TENANCY           = var.TENANCY
  CIDR_BLOCK_SUBNET = var.CIDR_BLOCK_SUBNET
  NAME              = var.NAME
}


module "ec2" {
  source       = "../modules/ec2"

  AMI_ID          = var.AMI_ID
  INSTANCE_TYPE = var.INSTANCE_TYPE
  SUBNET_ID    = module.vpc.subnet_id
  NAME         = var.NAME
  REGION      = var.REGION
}