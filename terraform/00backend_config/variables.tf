variable "aws_region" {
  description = "Region where the bucket will be created"
}
variable "tags" {
  type = "map"
}
variable "tfstate_bucket_name" {
  description = "The bucket name for trraform tf state files"
}
variable "artifact_bucket_name" {
  description = "The bucket name for trraform tf state files"
}
variable "aws_local_profile" {}
