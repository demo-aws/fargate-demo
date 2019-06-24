provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_local_profile}"
  shared_credentials_file = "/Users/rmiazaki/.aws/creds"
}

terraform {
  backend "s3" {
    # The key values from this block are defined on ../inventories/{env}/s3backend
    acl            = "private"
    dynamodb_table = "terraform-state-lock"
  }
}

# Get data from other modules (network)
data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "aws-demo-tfstate-bucket"
    key    = "${var.env}/network/${var.env}.tfstate"
    region = "${var.aws_region}"
  }
}

# Create ecs cluster
module "ecs_cluster" {
  source = "git@github.com:demo-aws/tf_modules.git//aws/ecs_cluster/fargate"

  project_name          = "${var.project_name}"
  env                   = "${var.env}"
  app_port              = "${var.app_port}"
  tags                  = "${var.tags}"
  cidr_blocks_whitelist = "${var.cidr_blocks_whitelist}"

# vars from network module
  vpc_id                = "${data.terraform_remote_state.network.vpc_id}"
  public_subnet1_id     = "${data.terraform_remote_state.network.public_subnet1_id}"
  public_subnet2_id     = "${data.terraform_remote_state.network.public_subnet2_id}"
}

