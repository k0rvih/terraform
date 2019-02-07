resource "aws_security_group" "octo_worker_linux" {
  name = "octopus-worker-linux"
  description = "Managed by Terraform"
  vpc_id = "${var.vpc_id}"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.access_allowed}"]
    description = "Ukraine"
  }
  ingress {
    from_port   = 10933
    to_port     = 10933
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Octopus"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}