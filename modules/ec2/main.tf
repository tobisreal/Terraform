# creating an ec2 instance
resource "aws_instance" "nameofinstance" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  subnet_id            = var.subnet_id

  tags = {
    Name               = var.instance_name
  }
}

resource "aws_security_group" "instanceSG" {
  name_prefix = var.security_group_name_prefix

  ingress {
    from_port          = var.ingress_port
    to_port            = var.ingress_port
    protocol           = "tcp"
    cidr_blocks        = [var.ingress_cidr_block]
  }

  egress {
    from_port          = 0
    to_port            = 0
    protocol           = "-1"
    cidr_blocks        = ["0.0.0.0/0"]
  }
}



# creating an auto scaling group
resource "aws_autoscaling_group" "example_asg" {
  name                 = var.asg_name
  vpc_zone_identifier  = var.subnet_ids
  launch_configuration = aws_launch_configuration.example_lc.name
  min_size             = var.min_size
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  }

resource "aws_launch_configuration" "example_lc" {
  name_prefix          = var.lc_name
  image_id             = var.ami_id# replace with your own AMI ID
  instance_type        = var.instance_type
  security_groups      = ["${aws_security_group.example_sg.id}"]
}

resource "aws_security_group" "example_sg" {
  name_prefix          = "example"
  vpc_id               = var.vpc_id

  ingress {
    from_port = 0
    to_port            = 65535
    protocol           = "tcp"
    cidr_blocks        = ["0.0.0.0/0"]
  }
}