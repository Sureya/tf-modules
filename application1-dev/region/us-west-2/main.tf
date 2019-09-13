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
  source = "github.com/Sureya/tf-modules/ec2-module"
//  Other accepted source values for local & gitlab sources
//  source = "/can/be/a/relative/path/to/the/folder"
//  source = "git::ssh://git@git.sami.int.thomsonreuters.com/gcp-terraform-modules/centralised-logging.git?ref=develop"
  instance_name = "prod-instance"
}
