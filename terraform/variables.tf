variable "datadog_app_key" {
    type        = string
    description = "Datadog APP key"
}

variable "datadog_api_key" {
    type        = string
    description = "Datadog API key"
}

variable "datadog_forwarder_name" {
    type        = string
    description = "Datadog Forwarder Lambda name"
    default     = "datadog-forwarder"
}

variable "datadog_integration_name" {
    type        = string
    description = "Datadog AWS Integration IAM name"
    default     = "datadog-aws-integration"
}

variable "datadog_aws_account_id" {
    type        = string
    description = "Datadog AWS Account ID"
    default     = "464622532012"
}
