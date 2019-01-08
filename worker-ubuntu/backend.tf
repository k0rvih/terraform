terraform {
  backend "s3" {
    bucket = "ambertf"
    key    = "amberubuntu/terraform.tfstate"
    region = "us-east-1"
    access_key = "AKIAIZF7EDRRV36E4NWQ"
    secret_key = "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"
  }
}
