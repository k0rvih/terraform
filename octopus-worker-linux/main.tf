terraform {
  backend "s3" {
    profile = "amber"
    region = "us-east-1"
    bucket = "ambertf"
    key = "linux_worker/octopus-worker-linux"
  }
}

provider "aws" {
  region = "${var.aws_region}"
  profile = "${var.aws_profile}"
}
