resource "aws_vpc" "example" {
  cidr_block = "${var.vpc_cidr}"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.example.id}"
}

resource "aws_default_route_table" "route_table" {
  default_route_table_id = "${aws_vpc.example.default_route_table_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}

resource "aws_subnet" "sub" {
  count = "${length(var.subnets)}"

  vpc_id            = "${aws_vpc.example.id}"
  cidr_block        = "${lookup(var.subnets[count.index], "cidr")}"
  availability_zone = "${lookup(var.subnets[count.index], "az")}"

  tags {
    Name = "Example subnet ${count.index + 1}"
  }
}

resource "aws_security_group" "external" {
  name   = "world_to_instances"
  vpc_id = "${aws_vpc.example.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "${var.ssh_access_cidrs}"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
