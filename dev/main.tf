provider "aws" {
  region = "us-east-1"
}

module "my_vpc" {
  source      = "../modules/vpc"
  vpc_name    = "Dev-VPC"
  vpc_cidr    = "10.119.0.0/16"
  tenancy     = "default"
  subnet_name = "Dev-VPC-Main"
  vpc_id      = "${module.my_vpc.r_vpc_id}"
  subnet_cidr = "10.119.100.0/24"
}

module "my_ec2" {
  source        = "../modules/ec2"
  ec2_name      = "IM-CP-Dev-Demo"
  ec2_count     = 1
  ami_id        = "ami-0b69ea66ff7391e80"
  instance_type = "t2.micro"
  subnet_id     = "${module.my_vpc.r_subnet_id}"
}