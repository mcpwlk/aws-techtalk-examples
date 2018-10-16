terraform {
  required_version = "~> 0.11.8"
}

provider "aws" {
  version = "~> 1.40"
  region = "us-east-1"
}

resource "aws_instance" "nginx" {
  ami           = "ami-03f284fcd0a506f14"
  instance_type = "t2.micro"

  tags {
    Name = "HelloWorld"
  }
}
