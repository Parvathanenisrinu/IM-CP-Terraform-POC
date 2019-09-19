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

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "${var.vpc_name}-IGW"
	Attched-VPC ="${aws_vpc.main.id}" 
  }
}

resource "aws_route_table" "rt" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "${var.vpc_name}-rt"
  }
}
output "r_vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "r_subnet_id" {
  value = "${aws_subnet.main.id}"
}

output "r_igw_id" {
  value = "${aws_internet_gateway.igw.id}"
}
output "r_route_table_id" {
  value = "${aws_route_table.rt.id}"
}