output "endpoint" {
    value = "${aws_eip.nginx_eip.public_ip}"
}
