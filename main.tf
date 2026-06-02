locals {
  bucket_name = "${var.project}-${var.environment}-${var.bucket_suffix}"
}

resource "aws_s3_bucket" "main" {
  bucket = local.bucket_name
  tags = {
    Name        = local.bucket_name
    Project     = var.project
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}