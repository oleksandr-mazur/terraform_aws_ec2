resource "aws_key_pair" "sshkey" {
  key_name   = "default_ssh"
  public_key = ""
  tags = {
    Name        = "SSH"
    Environment = var.env
    Project     = var.project
  }
}