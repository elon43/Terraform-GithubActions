# Create VPC
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "demo_vpc" {
 cidr_block           = var.CIDR_BLOCK
 instance_tenancy     = var.TENANCY
 enable_dns_hostnames = true

 tags = {
   "Name" = "${var.NAME}-vpc"
 }
}

# Create VPC Internet Gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
resource "aws_internet_gateway" "demo_gateway" {
 vpc_id = aws_vpc.demo_vpc.id

 tags = {
   "Name" = "${var.NAME}-igw"
 }
}

# Access the list of AWS Availibility Zones within region
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones
data "aws_availability_zones" "az" {
    state = "available"
}

# Subnet for VPC
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "demo_subnet" {
 vpc_id                  = aws_vpc.demo_vpc.id
 cidr_block              = var.CIDR_BLOCK_SUBNET
 availability_zone       = data.aws_availability_zones.az.names[0]
 map_public_ip_on_launch = true

 tags = {
   "Name" = "${var.NAME}-subnet"
 }
}

# Routing table for VPC
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
resource "aws_route_table" "demo_route_table" {
 vpc_id = aws_vpc.demo_vpc.id

 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.demo_gateway.id
 }

 tags = {
   "Name" = "${var.NAME}-route"
 }
}

# Associate public subnet to route table
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "demo_association" {
 subnet_id      = aws_subnet.demo_subnet.id
 route_table_id = aws_route_table.demo_route_table.id
}