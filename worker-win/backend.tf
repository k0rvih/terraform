terraform {
  backend "s3" {
    bucket = "ambertf"
    key    = "amberwin/terraform.tfstate"
    region = "us-east-1"
  }
}
