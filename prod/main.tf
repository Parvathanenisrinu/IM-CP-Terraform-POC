provider "aws" {
  region = "us-east-1"
}

module "my_vpc" {
  source      = "../modules/vpc"
  vpc_name    = "Prod-VPC-VPC"
  vpc_cidr    = "10.219.0.0/16"
  tenancy     = "default"
  subnet_name = "Prod-VPC-Main"
  vpc_id      = "${module.my_vpc.r_vpc_id}"
  subnet_cidr = "10.219.100.0/24"
}

module "my_ec2" {
  source        = "../modules/ec2"
  ec2_name      = "IM-CP-Prod-Demo"
  ec2_count     = 2
  ami_id        = "ami-0b69ea66ff7391e80"
  instance_type = "t2.micro"
  subnet_id     = "${module.my_vpc.r_subnet_id}"
}