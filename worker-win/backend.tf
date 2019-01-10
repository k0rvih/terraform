terraform {
  backend "s3" {
    bucket = "ambertr"
    key    = "amberwin/terraform.tfstate"
    region = "us-east-1"
  }
}
