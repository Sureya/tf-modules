terraform {
  backend "s3" {
    bucket = "terraform-sample-state-bucket"
    key = "terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
  }

}

provider "aws" {
  region = "${var.region}"
  profile = "default"
}


module "ec2-prod-instance" {
  source = "/Users/sureyasathiamoorthi/repos/personal/personal/terraform-local/modules/ec2-module"
  instance_name = "prod-instance"
}
