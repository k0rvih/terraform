terraform {
  backend "s3" {
    bucket = "ambertr"
    key    = "amberubuntu/terraform.tfstate"
    region = "us-east-1"
  }
}
