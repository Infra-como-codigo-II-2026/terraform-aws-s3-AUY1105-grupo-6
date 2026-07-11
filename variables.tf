variable "project" {
  description = "Nombre del proyecto (usado en nombre del bucket y tags)"
  type        = string
}

variable "environment" {
  description = "Ambiente de despliegue (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "bucket_suffix" {
  description = "Sufijo para garantizar unicidad del bucket (ej: número de grupo)"
  type        = string
  default     = "data"
}

variable "versioning_enabled" {
  description = "Habilitar versionado del bucket"
  type        = bool
  default     = false
}
variable "create_lock_table" {
  description = "Crear una tabla DynamoDB para locking del state. Recomendado en true cuando este bucket se usa como backend remoto de Terraform"
  type        = bool
  default     = false
}