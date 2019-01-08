resource "aws_instance" "amber-web" {

  ami             = "${var.ami_linux}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ambersg.name}"]
  key_name        = "axs"
  user_data = <<EOF
              #!/bin/bash
              rpm --import "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
              su -c 'curl https://download.mono-project.com/repo/centos7-stable.repo | tee /etc/yum.repos.d/mono-centos7-stable.repo'
              url="${var.terraform_linuxurl}"
              trpackage="${var.trpackage}"
              yum install mono-devel -y
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