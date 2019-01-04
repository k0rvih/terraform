resource "aws_instance" "amber-web" {

  ami             = "${var.ami_linux}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ambersg.name}"]
  key_name        = "axs"
  user_data = <<EOF
  
  EOF
  
  tags {
    Name = "Octopus Worker Ubuntu"
    Schedule = "kyiv-office-hours"
  }

}


