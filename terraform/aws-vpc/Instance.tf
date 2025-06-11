resource "aws_instance" "name" {
  ami = var.AMI[var.REGION]
  instance_type = "t3.micro"
#   key_name = 
}