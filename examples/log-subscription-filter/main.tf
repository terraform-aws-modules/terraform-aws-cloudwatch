provider "aws" {
  region = "eu-west-1"
}

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
  role_arn        = module.cw_logs_to_firehose_iam_role.arn
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
  version = "~> 5.0"

  bucket_prefix = "${random_pet.this.id}-logs"

  force_destroy = true
}

resource "aws_kinesis_firehose_delivery_stream" "logs" {
  name        = "${random_pet.this.id}-logs"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = module.firehose_to_s3_iam_role.arn
    bucket_arn = module.logs_bucket.s3_bucket_arn
    prefix     = "from-firehose-logs/"
  }
}

module "firehose_to_s3_iam_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role"
  version = "~> 6.0"

  name = "${random_pet.this.id}-firehose-to-s3-"

  trust_policy_permissions = {
    TrustRoleAndServiceToAssume = {
      actions = [
        "sts:AssumeRole",
        "sts:TagSession",
      ]
      principals = [{
        type = "Service"
        identifiers = [
          "firehose.amazonaws.com"
        ]
      }]
    }
  }

  create_inline_policy = true
  inline_policy_permissions = {
    FirehoseToS3 = {
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
}

module "cw_logs_to_firehose_iam_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role"
  version = "~> 6.0"

  name = "${random_pet.this.id}-cw-logs-to-firehose-"

  trust_policy_permissions = {
    TrustRoleAndServiceToAssume = {
      actions = [
        "sts:AssumeRole",
        "sts:TagSession",
      ]
      principals = [{
        type = "Service"
        identifiers = [
          "logs.amazonaws.com"
        ]
      }]
    }
  }

  create_inline_policy = true
  inline_policy_permissions = {
    CwLogsToFirehose = {
      actions = [
        "firehose:PutRecord",
      ]
      resources = [
        aws_kinesis_firehose_delivery_stream.logs.arn,
      ]
    }
  }
}
