resource "aws_instance" "amber-web" {

  ami             = "${var.ami_linux}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ambersg.name}"]
  key_name        = "axs"
  user_data = <<EOF
              #!/bin/bash
              url="${var.terraform_linuxurl}"
              trpackage="${var.trpackage}"
              yum update -y
              yum install unzip
              wget $url
              unzip $trpackage
              mv terraform /usr/local/bin/
              EOF
              
    tags {
    Name = "Octopus Worker Ubuntu"
  }

}