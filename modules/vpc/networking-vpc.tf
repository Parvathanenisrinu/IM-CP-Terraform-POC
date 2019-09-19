resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"

  tags = {
    Name = "${var.vpc_name}"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet_cidr}"

  tags = {
    Name = "${var.subnet_name}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "${var.vpc_name}-IGW"
	Attched-VPC ="${aws_vpc.main.id}" 
  }
}

output "r_vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "r_subnet_id" {
  value = "${aws_subnet.main.id}"
}
