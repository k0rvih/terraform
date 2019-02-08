terraform {
  backend "s3" {
    profile = "amber"
    bucket = "ambertr"
    key    = "linux-worker/terraform.tfstate"
    region = "us-east-1"
  }
}


provider "aws" {
  region = "${var.aws_region}"
  profile = "${var.aws_profile}"
}
