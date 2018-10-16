variable vpc_cidr {
  default = "10.0.0.0/16"
}

variable subnets {
  type = "list"

  default = [
    {
      cidr = "10.0.0.0/24"
      az   = "us-east-1a"
    },
    {
      cidr = "10.0.1.0/24"
      az   = "us-east-1b"
    },
    {
      cidr = "10.0.2.0/24"
      az   = "us-east-1c"
    },
  ]
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
