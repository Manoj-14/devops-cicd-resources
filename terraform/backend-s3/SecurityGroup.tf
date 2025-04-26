# to create resource group
resource "aws_security_group" "dove-sg" {
  name        = "dove-sg"
  description = "dove-sg"
  # vpc_id = "vpc_name" //not provided means it will take default vpc
  tags = {
    "Name" = "allow_tls"
  }
}

# ingress means inbound rules
resource "aws_vpc_security_group_ingress_rule" "ssh-from-my-ip" {
  security_group_id = aws_security_group.dove-sg.id //above created sg name id
  cidr_ipv4         = "0.0.0.0/0"                   // my ip and /32 means allow for exact ip not range 
  from_port         = 22                            //port address that need to allow
  ip_protocol       = "tcp"                         // protocol
  to_port           = 22                            // should be same as from port
}

resource "aws_vpc_security_group_ingress_rule" "allow-http" {
  security_group_id = aws_security_group.dove-sg.id //above created sg name id
  cidr_ipv4         = "0.0.0.0/0"                   // any range of ip
  from_port         = 80                            //port address that need to allow
  ip_protocol       = "tcp"                         // protocol
  to_port           = 80                            // should be same as from port
}

# outbound rule
resource "aws_vpc_security_group_egress_rule" "allow-all-ipv4-out-bound" {
  security_group_id = aws_security_group.dove-sg.id //resource name
  cidr_ipv4         = "0.0.0.0/0"                   //all ipv4
  ip_protocol       = "-1"                          //semantically equivalant to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow-all-ipv6-out-bound" {
  security_group_id = aws_security_group.dove-sg.id //resource name
  cidr_ipv6         = "::/0"                        // all ipv6
  ip_protocol       = "-1"                          //semantically equivalant to all ports
}
