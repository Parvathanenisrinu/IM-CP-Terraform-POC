variable "ec2_name" {
  default = "IM-CP-Demo"
}

variable "ec2_count" {
  default = "1"
}

variable "ami_id" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "docker.pem"
}
variable "subnet_id" {}
