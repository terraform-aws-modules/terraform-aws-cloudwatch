provider "aws" {
  region = "eu-west-1"
}

locals {
  name = "metric-stream"
}

module "exclude_stream" {
  source = "../../modules/metric-stream"

  name          = "${local.name}-exclude"
  firehose_arn  = aws_kinesis_firehose_delivery_stream.s3_stream.arn
  output_format = "json"
  role_arn      = module.stream_to_firehose_role.iam_role_arn

  # conflicts with include_filter
  exclude_filter = {
    logs = {
      namespace = "AWS/Logs"
    }
    usage = {
      namespace    = "AWS/Usage"
      metric_names = ["CallCount", "ResourceCount"]
    }
  }
}

module "include_stream" {
  source = "../../modules/metric-stream"

  name          = "${local.name}-include"
  firehose_arn  = aws_kinesis_firehose_delivery_stream.s3_stream.arn
  output_format = "json"
  role_arn      = module.stream_to_firehose_role.iam_role_arn

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
  firehose_arn  = aws_kinesis_firehose_delivery_stream.s3_stream.arn
  output_format = "json"
  role_arn      = module.stream_to_firehose_role.iam_role_arn
}

resource "random_pet" "this" {
  length = 2
}

module "s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 3.15"

  bucket = "${local.name}-${random_pet.this.id}"

  force_destroy = true
}

resource "aws_kinesis_firehose_delivery_stream" "s3_stream" {
  name        = local.name
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = module.firehose_to_s3.iam_role_arn
    bucket_arn = module.s3.s3_bucket_arn
  }
}

module "firehose_to_s3" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 5.30"

  trusted_role_services = [
    "firehose.amazonaws.com"
  ]

  create_role = true

  role_name_prefix  = "${local.name}-firehose-to-s3-"
  role_requires_mfa = false

  custom_role_policy_arns = [
    module.firehose_to_s3_policy.arn
  ]
}

module "firehose_to_s3_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "~> 5.30"

  name        = "${local.name}-firehose-to-s3"
  path        = "/"
  description = local.name

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
      module.s3.s3_bucket_arn,
      "${module.s3.s3_bucket_arn}/*",
    ]
  }
}

module "stream_to_firehose_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 5.30"

  trusted_role_services = [
    "streams.metrics.cloudwatch.amazonaws.com"
  ]

  create_role = true

  role_name_prefix  = "${local.name}-to-firehose-"
  role_requires_mfa = false

  custom_role_policy_arns = [
    module.stream_to_firehose_policy.arn
  ]
}

module "stream_to_firehose_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "~> 5.30"

  name        = "${local.name}-to-firehose"
  path        = "/"
  description = local.name

  policy = data.aws_iam_policy_document.metric_stream_to_firehose.json
}

data "aws_iam_policy_document" "metric_stream_to_firehose" {
  statement {
    effect = "Allow"

    actions = [
      "firehose:PutRecord",
      "firehose:PutRecordBatch",
    ]

    resources = [aws_kinesis_firehose_delivery_stream.s3_stream.arn]
  }
}
