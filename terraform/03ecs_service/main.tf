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

data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "aws-demo-tfstate"
    key    = "${var.env}/network/${var.env}.tfstate"
    region = "${var.aws_region}"
  }
}

# Get data from other modules (ecs-cluster)
data "terraform_remote_state" "ecs_cluster" {
  backend = "s3"

  config = {
    bucket = "aws-demo-tfstate"
    key    = "${var.env}/ecs_cluster/${var.env}.tfstate"
    region = "${var.aws_region}"
  }
}

# Create ecs_service_node
module "ecs_service_node" {
  source = "git@github.com:demo-aws/tf_modules.git//aws/ecs_service_node"

  project_name      = "${var.project_name}"
  env               = "${var.env}"
  aws_account_id    = "${var.aws_account_id}"
  service_name      = "${var.service_name}"
  health_check_path = "${var.health_check_path}"
  container_port    = "${var.container_port}"
  priority          = "${var.priority}"
  command           = "${var.command}"
  artifact_store    = "${var.artifact_store}"
  artifact_name     = "${var.artifact_name}"
  aws_region        = "${var.aws_region}"
  tags              = "${var.tags}"
  node_path         = "${var.node_path}"

  vpc_id            = "${data.terraform_remote_state.network.vpc_id}"
  public_subnet1_id = "${data.terraform_remote_state.network.public_subnet1_id}"
  public_subnet2_id = "${data.terraform_remote_state.network.public_subnet2_id}"

  instance_count         = "${var.instance_count}"
  container_vcpu         = "${var.container_vcpu}"
  container_memory       = "${var.container_memory}"
  container_min_capacity = "${var.container_min_capacity}"
  container_max_capacity = "${var.container_max_capacity}"

  # Get after ecs_cluster infra creation
  ecs_service_role_arn = "${data.terraform_remote_state.ecs_cluster.ecs_service_role_arn}"
  alb_arn              = "${data.terraform_remote_state.ecs_cluster.alb_arn}"
  alb_name             = "${data.terraform_remote_state.ecs_cluster.alb_name}"
  target_group_name    = "${data.terraform_remote_state.ecs_cluster.alb_target_group_arn_suffix}"
  ecs_sg_id            = "${data.terraform_remote_state.ecs_cluster.ecs_cluster_sg_id}"

  listener_arn = "${data.terraform_remote_state.ecs_cluster.alb_listener_arn}"
  cluster_arn  = "${data.terraform_remote_state.ecs_cluster.ecs_cluster_arn}"
  cluster_name = "${data.terraform_remote_state.ecs_cluster.ecs_cluster_name}"
}
