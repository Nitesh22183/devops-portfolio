variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.3.0/24"
}

variable "az" {
  type    = string
  default = "ap-south-1a"
}

variable "environment" {
  type    = string
  default = "dev"
}
