resource "aws_instance" "nginx" {
  count = "${length(var.subnets)}"

  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${element(aws_subnet.sub.*.id, count.index)}"
  vpc_security_group_ids = ["${aws_security_group.external.id}"]
}

resource "aws_eip" "nginx_eip" {
  count = "${length(var.subnets)}"
  vpc   = true
}

resource "aws_eip_association" "nginx_eip_assoc" {
  count = "${length(var.subnets)}"

  instance_id   = "${element(aws_instance.nginx.*.id, count.index)}"
  allocation_id = "${element(aws_eip.nginx_eip.*.id, count.index)}"
}
