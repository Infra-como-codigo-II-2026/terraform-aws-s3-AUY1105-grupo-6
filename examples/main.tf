provider "aws" {
  region = "us-east-1"
}

module "s3" {
  source = "github.com/Infra-como-codigo-II-2026/terraform-aws-s3-auy1105-grupo-6?ref=v1.0.0"

  project            = "auy1105"
  environment        = "dev"
  bucket_suffix      = "grupo-1-data"
  versioning_enabled = true
}

output "bucket_name" { value = module.s3.bucket_name }
output "bucket_arn"  { value = module.s3.bucket_arn }