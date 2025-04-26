
data "aws_ami" "amiId" { // get resource from external data out side the terraform (resource_name,name)
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"] //name of the ami i.e. jammy
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

output "instance_id" {
  description = "AMI ID of ubuntu instance"
  value       = data.aws_ami.amiId.id //output of above data block
}
