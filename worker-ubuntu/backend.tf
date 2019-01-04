terraform {
  backend "s3" {
    bucket = "ambertf"
    key    = "amberubuntu/terraform.tfstate"
    region = "us-east-1"
  }
}
