data "template_file" "worker_win" {
    template = "${file("user_data.sh")}"

    vars {
        url = "${var.octo_url}"
        output = "${var.output}"
        octoapi = "${var.octo_api}"
        octoserver = "${var.octo_server}"
        role = "${var.octorole}"
        env = "${var.octoenv}"
    }
}