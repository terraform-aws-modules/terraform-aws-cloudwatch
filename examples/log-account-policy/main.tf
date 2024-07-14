provider "aws" {
  region = "eu-west-1"
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

module "log_group" {
  source = "../../modules/log-group"

  name_prefix       = "my-log-group-"
  retention_in_days = 7
}

module "excluded_log_group" {
  source = "../../modules/log-group"

  name_prefix       = "my-excluded-log-group-"
  retention_in_days = 7
}

module "audit_destination_group" {
  source = "../../modules/log-group"

  name_prefix       = "audit-destination-log-group-"
  retention_in_days = 7
}

module "log_account_data_retention_policy" {
  source = "../../modules/log-account-policy"

  log_account_policy_name           = "account-data-protection"
  log_account_policy_type           = "DATA_PROTECTION_POLICY"
  create_log_data_protection_policy = true
  log_data_protection_policy_name   = "redact-addresses"

  data_identifiers                          = ["arn:aws:dataprotection::aws:data-identifier/Address"]
  findings_destination_cloudwatch_log_group = module.audit_destination_group.cloudwatch_log_group_name
}

# This example requires two terraform applies and will error on the first run due to firehose stream not in ACTIVE state even with depends_on set
# Related: https://github.com/hashicorp/terraform-provider-aws/issues/17049
module "log_account_subscription_filter_policy" {
  source = "../../modules/log-account-policy"

  log_account_policy_name = "account-subscription-filter"
  log_account_policy_type = "SUBSCRIPTION_FILTER_POLICY"
  policy_document = jsonencode(
    {
      DestinationArn = aws_kinesis_firehose_delivery_stream.logs.arn
      FilterPattern  = "%test%"
      RoleArn        = module.cw_logs_to_firehose.iam_role_arn
    }
  )
  log_account_policy_selection_criteria = "LogGroupName NOT IN [\"${module.excluded_log_group.cloudwatch_log_group_name}\"]"

  depends_on = [
    aws_kinesis_firehose_delivery_stream.logs,
    module.cw_logs_to_firehose,
    module.cw_logs_to_firehose_policy
  ]
}

################################################################################
# Supporting Resources
################################################################################

resource "random_pet" "this" {
  length = 2
}

module "logs_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 4.0"

  bucket_prefix = "${random_pet.this.id}-logs"

  force_destroy = true
}

resource "aws_kinesis_firehose_delivery_stream" "logs" {
  name        = "${random_pet.this.id}-logs"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = module.firehose_to_s3.iam_role_arn
    bucket_arn = module.logs_bucket.s3_bucket_arn
    prefix     = "from-firehose-logs/"
  }
}

module "firehose_to_s3" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 5.0"

  trusted_role_services = [
    "firehose.amazonaws.com"
  ]

  create_role = true

  role_name_prefix  = "${random_pet.this.id}-firehose-to-s3-"
  role_requires_mfa = false

  custom_role_policy_arns = [
    module.firehose_to_s3_policy.arn
  ]
}

module "firehose_to_s3_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "~> 5.0"

  name        = "${random_pet.this.id}-firehose-to-s3"
  path        = "/"
  description = "Pipes logging firehose to s3 policy"

  policy = data.aws_iam_policy_document.firehose_to_s3.json
}

data "aws_iam_policy_document" "firehose_to_s3" {
  statement {
    effect = "Allow"

    actions = [
      "s3:AbortMultipartUpload",
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:PutObject",
    ]

    resources = [
      module.logs_bucket.s3_bucket_arn,
      "${module.logs_bucket.s3_bucket_arn}/*",
    ]
  }
}

module "cw_logs_to_firehose" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 5.0"

  create_role = true

  role_name_prefix                = "${random_pet.this.id}-cw-logs-to-firehose-"
  role_requires_mfa               = false
  create_custom_role_trust_policy = true
  custom_role_trust_policy        = data.aws_iam_policy_document.custom_trust_policy.json

  custom_role_policy_arns = [
    module.cw_logs_to_firehose_policy.arn
  ]
}

data "aws_iam_policy_document" "custom_trust_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    condition {
      test     = "StringLike"
      variable = "aws:SourceArn"
      values   = ["arn:aws:logs:${data.aws_region.current.id}:${data.aws_caller_identity.current.account_id}:*"]
    }

    principals {
      identifiers = ["logs.amazonaws.com"]
      type        = "Service"
    }
  }
}

module "cw_logs_to_firehose_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "~> 5.0"

  name        = "${random_pet.this.id}-cw-logs-to-firehose"
  path        = "/"
  description = "Cloudwatch logs to firehose policy"

  policy = data.aws_iam_policy_document.cw_logs_to_firehose.json
}

data "aws_iam_policy_document" "cw_logs_to_firehose" {
  statement {
    effect = "Allow"

    actions = [
      "firehose:PutRecord",
    ]

    resources = [
      aws_kinesis_firehose_delivery_stream.logs.arn,
    ]
  }
}
