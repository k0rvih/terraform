resource "aws_instance" "octopus_worker_linux" {

  ami             = "${var.ami_linux}"
  instance_type   = "${var.instance_type}"
  security_groups = ["${aws_security_group.octo_worker_linux.id}"]
  key_name        = "${var.key_name}"
  subnet_id       = "${var.subnet_id}"
  user_data       = "${data.template_file.worker.rendered}"
  associate_public_ip_address = true

  tags {
    Name = "octopus-worker-linux-01"
  }
}

data "template_file" "worker" {
  template = "${file("./user_data/user_data.py")}"

  vars {
    serverUrl=""
    apiKey="API-value"
    accountName="amber-Linux-Worker"
    machineName="linux-worker"
  }
}
