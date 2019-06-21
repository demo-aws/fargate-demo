variable "project_name" { }
variable "env" { }
variable "app_port" { }
variable "tags" {
  type = "map"
}
variable "cidr_blocks_whitelist" {
  type = "list"
}
variable "aws_region" {}
variable "aws_local_profile" {}
