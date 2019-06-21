provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_local_profile}"
}

terraform {
  backend "s3" {
    # The key values from this block are defined on ../inventories/{env}/s3backend
    acl            = "private"
    dynamodb_table = "terraform-state-lock"
  }
}

module "network" {
  source = "git@github.com:demo-aws/tf_modules.git//aws/network"

  vpc_cidr_block = "${var.vpc_cidr_block}"
  public_subnet1_cidr_block = "${var.public_subnet1_cidr_block}"
  public_subnet2_cidr_block = "${var.public_subnet2_cidr_block}"
  private_subnet1_cidr_block = "${var.private_subnet1_cidr_block}"
  private_subnet2_cidr_block = "${var.private_subnet2_cidr_block}"
  availability_zone1 = "${var.availability_zone1}"
  availability_zone2 = "${var.availability_zone2}"
  project_name = "${var.project_name}"
  env = "${var.env}"
  tags = "${var.tags}"
}