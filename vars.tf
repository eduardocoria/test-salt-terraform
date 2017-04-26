variable "AWS_REGION" {
  default = "eu-west-1"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "EduardoCoria"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "EduardoCoria.pub"
}
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-4dd2575b"
    us-west-2 = "ami-e6095386"
    eu-west-1 = "ami-c0cff0a6"
  }
}
