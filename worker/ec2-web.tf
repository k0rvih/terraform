resource "aws_instance" "amber-web" {

  ami             = "ami-0080e4c5bc078760e"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ambersg.name}"]
  key_name        = "axs"
  
  tags {
    Name = "Octopus Worker"
    Schedule = "kyiv-office-hours"
  }

}


