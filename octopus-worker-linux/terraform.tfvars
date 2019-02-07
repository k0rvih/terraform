aws_profile = "amber"
aws_region = "us-east-1"
ami_linux =  "ami-035be7bafff33b6b6"# Amazon Linux 2 AMI
instance_type = "t2.micro"
key_name      = "axs"
vpc_id    = "vpc-fa4afc80" # Dev-VPC
subnet_id = "subnet-fb1124b1" # Dev-Private-VPC99-1c
access_allowed = [
  "85.223.209.3/32",  # EPAM, Ukraine, Kyiv 1
  "85.223.209.22/32", # EPAM, Ukraine, Kyiv 2
  "63.32.196.125/32", # EPAM, Oleksii Konokhov
  "10.99.0.0/16",     # AWS, Internal range
  "10.10.0.0/16",     # AWS, Internal range
  "10.25.0.0/16"      # AWS, Internal range
]