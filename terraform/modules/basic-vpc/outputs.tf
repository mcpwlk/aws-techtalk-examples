output subnet_ids {
  value = "${aws_subnet.sub.*.id}"
}

output security_group_id {
  value = "${aws_security_group.external.id}"
}
