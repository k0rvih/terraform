terraform {
  backend "s3" {
    bucket = "ambertf"
    key    = "amber/terraform.tfstate"
    region = "us-east-1"
  }
}
