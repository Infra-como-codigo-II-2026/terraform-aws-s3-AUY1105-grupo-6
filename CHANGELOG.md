# Changelog

Formato basado en [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
y [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.1.0] - 2026-07-10

### Added
- Recurso `aws_dynamodb_table` opcional para locking del state, condicional a `create_lock_table`
- Variable `create_lock_table` (default `false`, no rompe compatibilidad con usos existentes)
- Outputs `dynamodb_table_name` y `dynamodb_table_arn`
- Documentación de uso como backend de state con locking en README.md

### Changed
- README actualizado con ejemplo de uso específico para backend de state

## [1.0.0] - 2026-06-01

### Added
- Recurso `aws_s3_bucket` parametrizable
- Recurso `aws_s3_bucket_versioning` con toggle on/off
- Recurso `aws_s3_bucket_public_access_block` con bloqueo total de acceso público
- Recurso `aws_s3_bucket_server_side_encryption_configuration` con AES256
- Variables `project` y `environment` para tags estandarizados
- Outputs `bucket_arn` y `bucket_id`
- Carpeta `examples/` con ejemplo funcional
- Documentación completa en README.md

## [0.1.0] - 2026-05-28

### Added
- Estructura inicial del módulo
- Recurso base `aws_s3_bucket`