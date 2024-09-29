provider "aws" {
}

resource "aws_instance" "ec2" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key-name
   vpc_security_group_ids = ["${aws_security_group.terraform_security_group.id}"]
   subnet_id = "${aws_subnet.terraform_public_1subnet.id}"
   tags{
    Name = "byterraformec2"
   }
}

locals {
  ingress_rules = [
    {
      port        = 22
      description = "Ingress rules for SSH"
    },
    {
      port        = 80
      description = "Ingress rules for HTTP"
    },
    {
      port        = 8080
      description = "Ingress rules for port 8080"
    }
    // Add more ports here in the future
  ]
}

resource "aws_security_group" "terraform_security_group" {
  name   = "terraform_securitygroup"
  vpc_id = aws_vpc.terraform.id

  dynamic "ingress" {
    for_each = local.ingress_rules

    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "outbound_rules"
  }
}


//creating a VPC
resource "aws_vpc" "terraform" {
    cidr_block = var.vpc_cidr
    tags = {
      Name = "terraform-vpc"
    }
  
}

// Creatomg a Subnet 
resource "aws_subnet" "terraform_public_1subnet" {
    vpc_id = "${aws_vpc.terraform.id}"
    cidr_block = var.subnet_cidr
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1a"
    tags = {
      Name = "terraform vpc public subnet1"
    }
  
}

//Creating a Internet Gateway 
resource "aws_internet_gateway" "terraform_internet_1_gateway" {
    vpc_id = "${aws_vpc.terraform.id}"
    tags = {
      Name = "terraform internet gateway"
    }
}

// Create a route table 
resource "aws_route_table" "terraform_route_table" {
    vpc_id = "${aws_vpc.terraform.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.terraform_internet_1_gateway.id}"
    }
    tags = {
      Name = "terraform route table "
    }
}

// Associate subnet with routetable 

resource "aws_route_table_association" "assoc" {
    subnet_id = "${aws_subnet.terraform_public_1subnet.id}"
    route_table_id = "${aws_route_table.terraform_route_table.id}"
  
}