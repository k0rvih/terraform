resource "aws_eip" "amber-eip" {
  instance = "${aws_instance.amber-web.id}"
}
