data "template_file" "worker_win" {
    template = "${file("user_data.ps1")}"

    vars {
        url = "${var.octo_url}"
        octoapi = "${var.octo_api}"
        octoserver = "${var.octo_server}"
        role = "${var.octorole}"
        env = "${var.octoenv}"
    }
}