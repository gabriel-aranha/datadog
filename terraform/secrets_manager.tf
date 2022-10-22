resource "aws_secretsmanager_secret" "datadog_api_key" {
    name        = "datadog_api_key"
    description = "Encrypted Datadog API Key"
}

resource "aws_secretsmanager_secret_version" "datadog_api_key" {
    secret_id     = aws_secretsmanager_secret.datadog_api_key.id
    secret_string = var.datadog_api_key
}
