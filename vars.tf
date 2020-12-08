variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-east-2"
}
variable "AMIS" {
  type = map
  default = {
   us-east-2 = "ami-07c1207a9d40bc3bd"
   us-west-2 = "ami-003634241a8fcdec0"
   eu-west-1 = "ami-0701e7be9b2a77600"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "./keys/mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "./keys/mykey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "RDS_NAME" {
  default = "app"
}

variable "RDS_USER" {
  default = "root"
}

variable "RDS_PASSWORD" { }
