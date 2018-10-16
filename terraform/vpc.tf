resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
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
  vpc_id            = "${aws_vpc.example.id}"
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags {
    Name = "Example subnet"
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
    cidr_blocks = ["12.34.56.78/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
