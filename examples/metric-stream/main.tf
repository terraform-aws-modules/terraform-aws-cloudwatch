provider "aws" {
  region = "eu-west-1"
}

locals {
  name = "metric-stream"
}

module "stream_with_exclude_filter" {
  source = "../../modules/metric-stream"

  name          = "${local.name}-with-exclude-filter"
  firehose_arn  = aws_kinesis_firehose_delivery_stream.s3_exclude_stream.arn
  output_format = "json"
  role_arn      = module.stream_to_firehose_iam_role.arn

  # conflicts with include_filter
  exclude_filter = {
    logs = {
      namespace = "AWS/Logs"
    }
    usage = {
      namespace    = "AWS/Usage"
      metric_names = ["CallCount", "ResourceCount"]
    }
    kms = {
      namespace    = "AWS/Firehose"
      metric_names = ["KMSKeyDisabled"]
    }
  }
}

module "stream_with_include_filter" {
  source = "../../modules/metric-stream"

  name          = "${local.name}-with-include-filter"
  firehose_arn  = aws_kinesis_firehose_delivery_stream.s3_include_stream.arn
  output_format = "json"
  role_arn      = module.stream_to_firehose_iam_role.arn

  # conflicts with exclude_filter
  include_filter = {
    ec2 = {
      namespace    = "AWS/EC2"
      metric_names = ["CPUUtilization", "NetworkIn"]
    }
  }

  statistics_configuration = [
    {
      additional_statistics = ["p99"]
      include_metric = [
        {
          namespace   = "AWS/EC2"
          metric_name = "CPUUtilization"
        },
        {
          namespace   = "AWS/EC2"
          metric_name = "NetworkIn"
        }
      ]
    },
    {
      additional_statistics = ["p90", "TM(10%:90%)"]
      include_metric = [
        {
          namespace   = "AWS/EC2"
          metric_name = "CPUUtilization"
        }
      ]
    }
  ]
}

module "stream_all" {
  source = "../../modules/metric-stream"

  name          = "${local.name}-all"
  firehose_arn  = aws_kinesis_firehose_delivery_stream.s3_all_stream.arn
  output_format = "json"
  role_arn      = module.stream_to_firehose_iam_role.arn
}

module "stream_all_disabled" {
  source = "../../modules/metric-stream"

  create = false

  name          = "${local.name}-all-disabled"
  firehose_arn  = aws_kinesis_firehose_delivery_stream.s3_all_stream.arn
  output_format = "json"
  role_arn      = module.stream_to_firehose_iam_role.arn
}

module "metrics_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 5.0"

  bucket_prefix = "${local.name}-"

  force_destroy = true
}

resource "aws_kinesis_firehose_delivery_stream" "s3_include_stream" {
  name        = "${local.name}-include-filter-example"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = module.firehose_to_s3_iam_role.arn
    bucket_arn = module.metrics_bucket.s3_bucket_arn
    prefix     = "include-filter/"
  }
}

resource "aws_kinesis_firehose_delivery_stream" "s3_exclude_stream" {
  name        = "${local.name}-exclude-filter-example"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = module.firehose_to_s3_iam_role.arn
    bucket_arn = module.metrics_bucket.s3_bucket_arn
    prefix     = "exclude-filter/"
  }
}

resource "aws_kinesis_firehose_delivery_stream" "s3_all_stream" {
  name        = "${local.name}-all-example"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = module.firehose_to_s3_iam_role.arn
    bucket_arn = module.metrics_bucket.s3_bucket_arn
    prefix     = "all/"
  }
}

module "firehose_to_s3_iam_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role"
  version = "~> 6.0"

  name = "${local.name}-firehose-to-s3-"

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
        module.metrics_bucket.s3_bucket_arn,
        "${module.metrics_bucket.s3_bucket_arn}/*",
      ]
    }
  }
}

module "stream_to_firehose_iam_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role"
  version = "~> 6.0"

  name = "${local.name}-to-firehose-"

  trust_policy_permissions = {
    TrustRoleAndServiceToAssume = {
      actions = [
        "sts:AssumeRole",
        "sts:TagSession",
      ]
      principals = [{
        type = "Service"
        identifiers = [
          "streams.metrics.cloudwatch.amazonaws.com"
        ]
      }]
    }
  }

  create_inline_policy = true
  inline_policy_permissions = {
    StreamToFirehose = {
      actions = [
        "firehose:PutRecord",
        "firehose:PutRecordBatch",
      ]
      resources = [
        aws_kinesis_firehose_delivery_stream.s3_include_stream.arn,
        aws_kinesis_firehose_delivery_stream.s3_exclude_stream.arn,
        aws_kinesis_firehose_delivery_stream.s3_all_stream.arn,
      ]
    }
  }
}
