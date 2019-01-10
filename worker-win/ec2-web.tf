resource "aws_instance" "amber-web" {

  ami             = "${var.ami_win}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ambersg.name}"]
  key_name        = "axs"
  user_data = "${data.template_file.worker_win.rendered}"
  
  tags {
    Name = "Octopus Win Worker"
  }

}


