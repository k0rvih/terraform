data "template_file" "worker" {
    template = "${file("user_data.sh")}"

    vars {
        trpackage = "${var.trpackage}"
        url = "${var.terraform_linuxurl}"
    }
}