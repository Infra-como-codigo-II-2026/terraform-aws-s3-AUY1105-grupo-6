# terraform-aws-s3-auy1105-grupo-6

Módulo Terraform para creación de buckets S3 seguros: acceso público bloqueado,
cifrado AES256 en reposo y versionado configurable.

El nombre del bucket se construye internamente como `{project}-{environment}-{bucket_suffix}`,
garantizando unicidad sin necesidad de hardcodear nombres completos.

## Uso

```hcl
module "storage" {
  source = "github.com/Infra-como-codigo-II-2026/terraform-aws-s3-auy1105-grupo-6?ref=v1.0.0"

  project            = "auy1105"
  environment        = "dev"
  bucket_suffix      = "grupo-1-data"
  versioning_enabled = true
}
```

## Variables

| Variable           | Descripción                                              | Tipo   | Default  | Requerido |
|--------------------|----------------------------------------------------------|--------|----------|-----------|
| project            | Nombre del proyecto (parte del nombre del bucket)        | string | —        | sí        |
| environment        | Ambiente de despliegue (dev, staging, prod)              | string | "dev"    | no        |
| bucket_suffix      | Sufijo para garantizar unicidad (ej: número de grupo)    | string | "data"   | no        |
| versioning_enabled | Habilitar versionado del bucket                          | bool   | false    | no        |

## Outputs

| Output      | Descripción                                        |
|-------------|----------------------------------------------------|
| bucket_name | Nombre del bucket creado (`project-environment-suffix`) |
| bucket_arn  | ARN del bucket                                     |
| bucket_id   | ID del bucket                                      |

## Nombre del bucket

El nombre se construye automáticamente dentro del módulo:
{project}-{environment}-{bucket_suffix}
ejemplo: auy1105-dev-grupo-1-data
Esto garantiza unicidad entre grupos y ambientes sin exponer nombres hardcodeados
ni requerir variables de entorno o secretos.

## Recursos creados

- `aws_s3_bucket` — Bucket principal
- `aws_s3_bucket_versioning` — Configuración de versionado
- `aws_s3_bucket_public_access_block` — Bloqueo completo de acceso público
- `aws_s3_bucket_server_side_encryption_configuration` — Cifrado AES256

## Dependencias

- Terraform >= 1.3.0
- AWS Provider ~> 5.0

## Ejemplo completo

Ver carpeta [`examples/`](./examples/).

## Versionado

Ver [CHANGELOG.md](./CHANGELOG.md) para el historial de cambios.