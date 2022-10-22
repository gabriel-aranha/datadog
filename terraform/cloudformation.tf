resource "aws_cloudformation_stack" "datadog_forwarder" {
    name         = var.datadog_forwarder_name
    capabilities = ["CAPABILITY_IAM", "CAPABILITY_NAMED_IAM", "CAPABILITY_AUTO_EXPAND"]
    parameters   = {
        DdApiKeySecretArn   = aws_secretsmanager_secret.datadog_api_key.arn
        DdSite              = "datadoghq.com"
        FunctionName        = var.datadog_forwarder_name
        ReservedConcurrency = 0
    }
    template_url = "https://datadog-cloudformation-template.s3.amazonaws.com/aws/forwarder/latest.yaml"
}
