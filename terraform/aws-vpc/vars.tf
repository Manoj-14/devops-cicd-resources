variable "REGION" {
  default = "us-west-1"
}

variable "ZONE1" {
  default = "us-west-1b"
}

variable "ZONE2" {
  default = "us-west-1c"
}

variable "AMI" {
  default = {
    "us-west-1":"ami-04fc83311a8d478df"
  }
}