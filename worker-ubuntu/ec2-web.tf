resource "aws_instance" "amber-web" {

  ami             = "${var.ami_linux}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ambersg.name}"]
  key_name        = "axs"
  user_data = <<EOF
  #!/bin/bash
  URL="${var.terraform_linuxurl}"
  trversion="${var.trversion}"
  trversion=$${trversion}_linux_amd64.zip
  sudo apt install unzip
  wget $URL
  unzip $trversion
  sudo mv terraform /usr/local/bin/
  EOF
  
  tags {
    Name = "Octopus Worker Ubuntu"
    Schedule = "kyiv-office-hours"
  }

}


