resource "aws_instance" "web" {
  ami                    = data.aws_ami.amiId.id // ami id from InstID thet we created
  instance_type          = "t3.micro"
  key_name               = "dove-key"                      //we may also give only name i.e deve-key
  vpc_security_group_ids = [aws_security_group.dove-sg.id] // default if not mentioned
  availability_zone      = "us-east-1a"

  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }
}

#if we don't store the state then terraform doesn't going to know if the manualy change the instances
# below code shows how to maintain the state

resource "aws_ec2_instance_state" "web-state" {
  instance_id = aws_instance.web.id
  state       = "running" //case-sensitive
}
