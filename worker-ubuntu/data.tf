data "template_file" "worker" {
    template = "${file("user_data.sh")}"
}