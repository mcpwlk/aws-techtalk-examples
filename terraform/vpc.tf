module "vpc" {
  source = "modules/basic-vpc"

  vpc_cidr         = "${var.vpc_cidr}"
  subnets          = "${var.subnets}"
  ssh_access_cidrs = "${var.ssh_access_cidrs}"
}
