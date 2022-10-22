resource "aws_iam_role" "datadog_aws_integration" {
    name               = var.datadog_integration_name
    assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
    statement {
        actions = ["sts:AssumeRole"]
    

        principals {
            type        = "AWS"
            identifiers = [var.datadog_aws_account_id]
        }

        condition {        
            test = "StringEquals"
            variable = "sts:ExternalId"
            values = [
                datadog_integration_aws.main.external_id
            ]
        }
    }
}

data "aws_iam_policy_document" "datadog_aws_integration" {
    statement {
        actions = [
            "apigateway:GET",
            "autoscaling:Describe*",
            "budgets:ViewBudget",
            "cloudformation:DetectStack*",
            "cloudfront:GetDistributionConfig",
            "cloudfront:ListDistributions",
            "cloudtrail:LookupEvents",
            "cloudtrail:DescribeTrails",
            "cloudtrail:GetTrailStatus",
            "cloudwatch:Describe*",
            "cloudwatch:Get*",
            "cloudwatch:List*",
            "codedeploy:List*",
            "codedeploy:BatchGet*",
            "directconnect:Describe*",
            "dynamodb:List*",
            "dynamodb:Describe*",
            "ec2:Describe*",
            "ecs:Describe*",
            "ecs:List*",
            "elasticache:Describe*",
            "elasticache:List*",
            "elasticfilesystem:DescribeAccessPoints",
            "elasticfilesystem:DescribeFileSystems",
            "elasticfilesystem:DescribeTags",
            "elasticloadbalancing:Describe*",
            "elasticmapreduce:List*",
            "elasticmapreduce:Describe*",
            "es:ListTags",
            "es:ListDomainNames",
            "es:DescribeElasticsearchDomains",
            "fsx:DescribeFileSystems",
            "health:DescribeEvents",
            "health:DescribeEventDetails",
            "health:DescribeAffectedEntities",
            "kinesis:List*",
            "kinesis:Describe*",
            "lambda:AddPermission",
            "lambda:GetPolicy",
            "lambda:List*",
            "lambda:RemovePermission",
            "logs:Get*",
            "logs:Describe*",
            "logs:FilterLogEvents",
            "logs:TestMetricFilter",
            "logs:PutSubscriptionFilter",
            "logs:DeleteSubscriptionFilter",
            "logs:DescribeSubscriptionFilters",
            "organizations:DescribeOrganization",
            "rds:Describe*",
            "rds:List*",
            "redshift:DescribeClusters",
            "redshift:DescribeLoggingStatus",
            "route53:List*",
            "s3:GetBucketLogging",
            "s3:GetBucketLocation",
            "s3:GetBucketNotification",
            "s3:GetBucketTagging",
            "s3:ListAllMyBuckets",
            "s3:PutBucketNotification",
            "ses:Get*",
            "sns:List*",
            "sns:Publish",
            "states:ListStateMachines",
            "states:DescribeStateMachine",
            "sqs:ListQueues",
            "support:*",
            "tag:GetResources",
            "tag:GetTagKeys",
            "tag:GetTagValues",
            "xray:BatchGetTraces",
            "xray:GetTraceSummaries"
        ]
        resources = ["*"]
    }
}

resource "aws_iam_policy" "datadog_aws_integration" {
    name   = var.datadog_integration_name
    policy = data.aws_iam_policy_document.datadog_aws_integration.json
}

resource "aws_iam_role_policy_attachment" "datadog_aws_integration" {
    role       = aws_iam_role.datadog_aws_integration.name
    policy_arn = aws_iam_policy.datadog_aws_integration.arn
}
