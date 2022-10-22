data "aws_lambda_function" "datadog_forwarder" {
    function_name = var.datadog_forwarder_name
}

resource "datadog_integration_aws" "main" {
    account_id                 = data.aws_caller_identity.current.account_id
    role_name                  = var.datadog_integration_name
    metrics_collection_enabled = "false"
}

resource "datadog_integration_aws_lambda_arn" "datadog_forwarder" {
    account_id = data.aws_caller_identity.current.account_id
    lambda_arn = data.aws_lambda_function.datadog_forwarder.arn

    depends_on = [
        aws_cloudformation_stack.datadog_forwarder,
        datadog_integration_aws.main
    ]
}

resource "datadog_integration_aws_log_collection" "main" {
    account_id = data.aws_caller_identity.current.account_id
    services   = ["lambda"]

    depends_on = [
        aws_cloudformation_stack.datadog_forwarder,
        datadog_integration_aws.main
    ]
}
