# Ejemplo — módulo S3

Crea un bucket S3 con bloqueo de acceso público, cifrado AES256 y versionado.

## Uso

```bash
export AWS_ACCESS_KEY_ID=<key>
export AWS_SECRET_ACCESS_KEY=<secret>
export AWS_SESSION_TOKEN=<token>

terraform init
terraform apply
terraform destroy
```