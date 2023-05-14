# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  region  = var.REGION
  profile = "default"
}

# Create a backend using S3
# https://developer.hashicorp.com/terraform/language/settings/backends/configuration
# https://developer.hashicorp.com/terraform/language/settings/backends/s3
terraform {
  backend "s3" {
    bucket = "terraform-course-state-1234"
    key    = "medium/Terraform_GithubActions/dev/terraform.tfstate" #directory where stuff is writter
    region = "us-east-1"
  }
}
