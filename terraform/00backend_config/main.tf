provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_local_profile}"
}

module "backend_config" {
  source = "git@github.com:demo-aws/tf_modules.git//aws/backend_config"

  tfstate_bucket_name = "${var.tfstate_bucket_name}"
  artifact_bucket_name = "${var.artifact_bucket_name}"
  aws_region = "${var.aws_region}"
  tags = "${var.tags}"
}