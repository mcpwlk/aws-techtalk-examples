resource "aws_instance" "nginx" {
  ami                    = "ami-03f284fcd0a506f14"
  instance_type          = "t2.micro"
  subnet_id              = "${aws_subnet.sub.id}"
  vpc_security_group_ids = ["${aws_security_group.external.id}"]
}
