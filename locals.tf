locals {
  aws_region = "eu-central-1"

  vpc_cidr         = "10.10.0.0/16"
  vpc_cidr_publicA = "10.10.1.0/24"

  ami_ubuntu_21_04 = "ami-0330191f6d64c38ba"

  all_ips       = ["0.0.0.0/0"]
  local_ips     = ["10.0.0.0/8"]
  ssh_port      = 22
  https_port    = 443
  http_port     = 80
  tcp_protocol  = "tcp"
  udp_protocol  = "udp"
  any_protocol  = "-1"
  icmp_protocol = "icmp"
}