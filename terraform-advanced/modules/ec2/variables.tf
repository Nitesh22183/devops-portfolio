variable "ami" {
  type    = string
  default = "ami-0c55b159cbfafe1f0"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "subnet_id" {
  type    = string
  # no default — must be passed from vpc module output
}

variable "security_group_id" {
  type    = string
  # no default — must be passed from sg module output
}

variable "environment" {
  type    = string
  default = "dev"
}
