# terraform-aws-s3-auy1105-grupo-6

Módulo Terraform para creación de buckets S3 seguros: acceso público bloqueado,
cifrado AES256 en reposo, versionado configurable y locking opcional mediante
tabla DynamoDB — pensado tanto para uso general como para servir de backend
remoto del state de Terraform.

El nombre del bucket se construye internamente como `{project}-{environment}-{bucket_suffix}`,
garantizando unicidad sin necesidad de hardcodear nombres completos.

## Uso

### Uso general (sin locking)

```hcl
module "storage" {
  source = "github.com/Infra-como-codigo-II-2026/terraform-aws-s3-auy1105-grupo-6?ref=v1.1.0"

  project            = "auy1105"
  environment        = "dev"
  bucket_suffix      = "grupo-1-data"
  versioning_enabled = true
}
```

### Uso como backend de state (con locking DynamoDB)

```hcl
module "state_bucket" {
  source = "github.com/Infra-como-codigo-II-2026/terraform-aws-s3-auy1105-grupo-6?ref=v1.1.0"

  project            = "auy1105"
  environment        = "prod"
  bucket_suffix      = "tfstate-grupo-6"
  versioning_enabled = true
  create_lock_table  = true
}
```

## Variables

| Variable           | Descripción                                                                          | Tipo   | Default  | Requerido |
|--------------------|---------------------------------------------------------------------------------------|--------|----------|-----------|
| project            | Nombre del proyecto (parte del nombre del bucket)                                     | string | —        | sí        |
| environment        | Ambiente de despliegue (dev, staging, prod)                                           | string | "dev"    | no        |
| bucket_suffix      | Sufijo para garantizar unicidad (ej: número de grupo)                                 | string | "data"   | no        |
| versioning_enabled | Habilitar versionado del bucket                                                       | bool   | false    | no        |
| create_lock_table  | Crear tabla DynamoDB para locking del state. Usar true si el bucket es backend remoto | bool   | false    | no        |

## Outputs

| Output               | Descripción                                                    |
|-----------------------|----------------------------------------------------------------|
| bucket_name           | Nombre del bucket creado (`project-environment-suffix`)        |
| bucket_arn            | ARN del bucket                                                  |
| bucket_id             | ID del bucket                                                   |
| dynamodb_table_name   | Nombre de la tabla de locking (`null` si create_lock_table = false) |
| dynamodb_table_arn    | ARN de la tabla de locking (`null` si create_lock_table = false)    |

## Nombre del bucket

El nombre se construye automáticamente dentro del módulo:
{project}-{environment}-{bucket_suffix}
ejemplo: auy1105-dev-grupo-1-data
Esto garantiza unicidad entre grupos y ambientes sin exponer nombres hardcodeados
ni requerir variables de entorno o secretos.

## Locking del state

Cuando `create_lock_table = true`, el módulo crea una tabla DynamoDB en modo
`PAY_PER_REQUEST` con clave de partición `LockID`, siguiendo el esquema que
Terraform espera para bloqueo de state. El nombre de la tabla es
`{bucket_name}-lock`.

Si en tu versión de Terraform (>= 1.10) prefieres usar el lockfile nativo de S3
en vez de DynamoDB, deja `create_lock_table = false` y agrega `use_lockfile = true`
directamente en el bloque `backend "s3"` de tu proyecto consumidor — son dos
mecanismos alternativos, no se usan ambos a la vez.

## Recursos creados

- `aws_s3_bucket` — Bucket principal
- `aws_s3_bucket_versioning` — Configuración de versionado
- `aws_s3_bucket_public_access_block` — Bloqueo completo de acceso público
- `aws_s3_bucket_server_side_encryption_configuration` — Cifrado AES256
- `aws_dynamodb_table` — Tabla de locking, condicional a `create_lock_table`

## Dependencias

- Terraform >= 1.3.0
- AWS Provider ~> 5.0

## Ejemplo completo

Ver carpeta [`examples/`](./examples/).

## Versionado

Ver [CHANGELOG.md](./CHANGELOG.md) para el historial de cambios.