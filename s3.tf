resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state"
  acl    = "private"

  lifecycle {
    prevent_destroy = true
  }

  versioning {
    enabled = true
  }

  tags = {
    Name        = "S3 Terraform State"
    Environment = var.env
    Project     = var.project
  }
}