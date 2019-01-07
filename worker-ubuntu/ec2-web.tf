resource "aws_instance" "amber-web" {

  ami             = "${var.ami_linux}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ambersg.name}"]
  key_name        = "axs"
  user_data = <<EOF
  #!/bin/bash
  url="https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip"
  trpackage="terraform_0.11.11_linux_amd64.zip"
  sudo apt install unzip
  wget $url
  unzip $trpackage
  sudo mv terraform /usr/local/bin/
  EOF
  
  tags {
    Name = "Octopus Worker Ubuntu"
    Schedule = "kyiv-office-hours"
  }

}


