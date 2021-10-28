
resource "aws_eip" "default" {
  instance = aws_instance.default.id

  tags = {
    Name        = "Elastic IP"
    Environment = var.env
    Project     = var.project
  }
}

resource "aws_instance" "defaut" {
    ami = local.ami_ubuntu_21_04
    availability_zone = format("%sa", local.aws_region)
    instance_type = var.instance_type
    key_name = aws_key_pair.sshkey
    subnet_id = aws_subnet.default-public.id
    vpc_security_group_ids = [ aws_security_group.default.id ]
    monitoring = false
    user_data = file("userdata/docker.sh")
    root_block_device {
      volume_size = var.volume_size
      volume_type = "gp3"
    }
    lifecycle {
        prevent_destroy = true
        ignore_changes = [ ami, instance_type, user_data ]
    }
    tags = {
      Name        = "EC2 Instance"
      Environment = var.env
      Project     = var.project
    }

    volume_tags = {
      Name        = "EC2 volume"
      Environment = var.env
      Project     = var.project
      Size        =  var.volume_size
    }
}


resource "aws_security_group" "default" {
    name = "default-sg"
    description = "Access to pinba services"
    vpc_id      = aws_vpc.created.id

    tags = {
        Name        = "Security Group"
        Environment = var.env
        Project     = var.project
    }
    ingress {
      from_port   = local.http_port
      to_port     = local.http_port
      protocol    = local.tcp_protocol
      cidr_blocks = local.all_ips
    }
    ingress {
      from_port   = local.https_port
      to_port     = local.http_port
      protocol    = local.tcp_protocol
      cidr_blocks = local.all_ips
    }
    ingress {
      from_port   = local.ssh_port
      to_port     = local.ssh_port
      protocol    = local.tcp_protocol
      cidr_blocks = [var.my_ip]
    }
    egress {
      from_port       = 0
      to_port         = 0
      protocol        = local.any_protocol
      cidr_blocks = local.all_ips
    }
}

output "ec2_ip" {
  value = aws_eip.default.public_ip
}
