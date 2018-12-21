terraform {
  backend "s3" {
    bucket = "ambertf"
    key    = "amber/terraform.tfstate"
    region = "us-east-1"
    access_key = "AKIAICCR74Q363JHODJQ"
    secret_key = "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"
  }
}
