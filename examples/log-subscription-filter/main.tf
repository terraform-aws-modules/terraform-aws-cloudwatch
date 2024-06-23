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

module "log_subscription_filter" {
  source = "../../modules/log-subscription-filter"

  name            = "my-filter"
  destination_arn = aws_kinesis_firehose_delivery_stream.logs.arn
  filter_pattern  = "%test%"
  log_group_name  = module.log_group.cloudwatch_log_group_name
  role_arn        = module.cw_logs_to_firehose.iam_role_arn
}

################################################################################
# Disabled
################################################################################

module "disabled" {
  source = "../../modules/log-subscription-filter"

  create = false
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
