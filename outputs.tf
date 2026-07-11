output "bucket_name" {
  description = "Nombre del bucket S3 creado"
  value       = aws_s3_bucket.main.bucket
}

output "bucket_arn" {
  description = "ARN del bucket S3"
  value       = aws_s3_bucket.main.arn
}

output "bucket_id" {
  description = "ID del bucket S3"
  value       = aws_s3_bucket.main.id
}
output "dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB de locking (null si create_lock_table = false)"
  value       = var.create_lock_table ? aws_dynamodb_table.lock[0].name : null
}

output "dynamodb_table_arn" {
  description = "ARN de la tabla DynamoDB de locking (null si create_lock_table = false)"
  value       = var.create_lock_table ? aws_dynamodb_table.lock[0].arn : null
}