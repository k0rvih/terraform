resource "aws_instance" "amber-web" {

  ami             = "${var.ami_linux}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ambersg.name}"]
  key_name        = "axs"
  
  tags {
    Name = "Octopus Worker"
    Schedule = "kyiv-office-hours"
  }

}


