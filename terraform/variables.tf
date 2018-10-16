variable vpc_cidr {
  default = "10.0.0.0/16"
}

variable subnet {
  type = "map"

  default = {
    cidr = "10.0.0.0/24"
    az   = "us-east-1a"
  }
}

variable ami {
  default = "ami-03f284fcd0a506f14"
}

variable instance_type {
  default = "t2.micro"
}

variable ssh_access_cidrs {
  type    = "list"
  default = ["12.34.56.78/32"]
}
