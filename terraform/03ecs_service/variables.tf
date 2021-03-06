variable "project_name" {}
variable "env" {}
variable "aws_account_id" {}
variable "instance_count" {}
variable "service_name" {}
variable "health_check_path" {}
variable "container_port" {}
variable "aws_region" {}
variable "priority" {}
variable "command" {}

variable "tags" {
  type = "map"
}

variable "artifact_store" {}
variable "artifact_name" {}
variable "node_path" {}
variable "container_vcpu" {}
variable "container_memory" {}
variable "container_min_capacity" {}
variable "container_max_capacity" {}
variable "aws_local_profile" {}
variable "github_repo" {}
variable "github_token" {}
variable "domain" {}
variable "zone_id" {}
variable "github_owner" {}
variable "github_branch" {}
