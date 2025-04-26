resource "aws_instance" "web" {
  ami                    = var.amiID[var.region] // ami id from InstID thet we created
  instance_type          = "t3.micro"
  key_name               = "dove-key"                      //we may also give only name i.e deve-key
  vpc_security_group_ids = [aws_security_group.dove-sg.id] // default if not mentioned
  availability_zone      = var.zone1

  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }
  # file provisioning
  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  # getting connection to remote inctance to ssh and run the cmds
  connection {
    type        = "ssh"
    user        = var.webuser     # from which user need to login
    private_key = file("dovekey") # private key to ssh
    host        = self.public_ip  # login to web instance(self)
  }

  # cmds to run web.sh file
  provisioner "remote-exec" {
    #list of cmds
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }
}

#if we don't store the state then terraform doesn't going to know if the manualy change the instances
# below code shows how to maintain the state

resource "aws_ec2_instance_state" "web-state" {
  instance_id = aws_instance.web.id
  state       = "running" //case-sensitive
}
