# Create an EC2 instance
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "demo_instance" {

ami               = var.AMI_ID
instance_type     = var.INSTANCE_TYPE
availability_zone = data.aws_availability_zones.az.names[0]
subnet_id         = var.SUBNET_ID

 tags = {
    "Name" = "${var.NAME}-instance"
  }
}

# Access the list of AWS Availibility Zones within region
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones
data "aws_availability_zones" "az" {
    state = "available"
}