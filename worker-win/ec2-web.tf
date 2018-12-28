resource "aws_instance" "amber-web" {

  ami             = "${var.ami_linux}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ambersg.name}"]
  key_name        = "axs"
  #user_data = "${data.template_file.ec2_user_data.rendered}"
  
  tags {
    Name = "Octopus Worker"
    Schedule = "kyiv-office-hours"
  }

}


