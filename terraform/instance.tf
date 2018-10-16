resource "aws_instance" "nginx" {
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${aws_subnet.sub.id}"
  vpc_security_group_ids = ["${aws_security_group.external.id}"]
}

resource "aws_eip" "nginx_eip" {
  instance = "${aws_instance.nginx.id}"
  vpc      = true
}

resource "aws_eip_association" "nginx_eip_assoc" {
  instance_id   = "${aws_instance.nginx.id}"
  allocation_id = "${aws_eip.nginx_eip.id}"
}
