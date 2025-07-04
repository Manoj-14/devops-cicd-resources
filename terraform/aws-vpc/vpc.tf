resource "aws_vpc" "dove" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"
  enable_dns_support = "true"
  tags = {
    "Name" = "dove-vpc"
  }
}

resource "aws_subnet" "dove-sub-pub-1" {
  vpc_id = aws_vpc.dove.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE1
  tags = {
    "Name" = "dove-sub-pub-1"
  }
}

resource "aws_subnet" "dove-sub-pub-2" {
  vpc_id = aws_vpc.dove.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE2
  tags = {
    "Name" = "dove-sub-pub-2"
  }
}

resource "aws_subnet" "dove-sub-priv-1" {
  vpc_id = aws_vpc.dove.id
  cidr_block = "10.0.3.0/24"
  availability_zone = var.ZONE1
  tags = {
    "Name" = "dove-sub-priv-1"
  }
}

resource "aws_subnet" "dove-sub-priv-2" {
  vpc_id = aws_vpc.dove.id
  cidr_block = "10.0.4.0/24"
  availability_zone = var.ZONE2
  tags = {
    "Name" = "dove-sub-priv-2"
  }
}

resource "aws_internet_gateway" "dove_IGW" {
  vpc_id = aws_vpc.dove.id
  tags = {
    "Name" = "dove_IGW"
  }
}

resource "aws_route_table" "dove-pub-RT" {
  vpc_id = aws_vpc.dove.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dove_IGW.id
    }

    tags = {
      "Name" = "dove-pub-RT"
    }
}

# Association of subnet and route table

resource "aws_route_table_association" "dove-sub-pub-1-a" {
  subnet_id = aws_subnet.dove-sub-pub-1.id
  route_table_id = aws_route_table.dove-pub-RT.id
}

resource "aws_route_table_association" "dove-sub-pub-2-a" {
  subnet_id = aws_subnet.dove-sub-pub-2.id
  route_table_id = aws_route_table.dove-pub-RT.id
}