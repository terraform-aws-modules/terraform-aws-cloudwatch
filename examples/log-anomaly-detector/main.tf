provider "aws" {
  region = "eu-west-1"
}

locals {
  name = "ex-${basename(path.cwd)}"
}

module "log_group" {
  source = "../../modules/log-group"

  name              = local.name
  retention_in_days = 7
  kms_key_id        = module.kms.key_arn
}

module "log_anomaly_detector" {
  source = "../../modules/log-anomaly-detector"

  detector_name           = local.name
  log_group_arns          = [module.log_group.cloudwatch_log_group_arn]
  anomaly_visibility_time = 7
  enabled                 = true
  evaluation_frequency    = "FIVE_MIN"
  filter_pattern          = "%test%"
  kms_key_id              = module.kms.key_arn
}

################################################################################
# Supporting Resources
################################################################################

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "~> 4.0"

  description = "KMS key for log anomaly detection"

  key_owners = [data.aws_caller_identity.current.arn]
  key_statements = [
    {
      sid = "CloudWatchLogs"
      actions = [
        "kms:Encrypt*",
        "kms:Decrypt*",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*",
        "kms:Describe*"
      ]
      resources = ["*"]

      principals = [
        {
          type        = "Service"
          identifiers = ["logs.${data.aws_region.current.name}.amazonaws.com"]
        }
      ]

      conditions = [
        {
          test     = "ArnLike"
          variable = "kms:EncryptionContext:aws:logs:arn"
          values = [
            "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:${local.name}",
            "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:anomaly-detector:*"
          ]
        }
      ]
    },
    {
      actions = [
        "kms:Encrypt*",
        "kms:Decrypt*",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*",
        "kms:Describe*"
      ]
      resources = ["*"]

      principals = [
        {
          type        = "Service"
          identifiers = ["logs.${data.aws_region.current.name}.amazonaws.com"]
        }
      ]

      conditions = [
        {
          test     = "ArnLike"
          variable = "kms:EncryptionContext:aws-crypto-ec:aws:logs:arn"
          values = [
            "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:anomaly-detector:*"
          ]
        }
      ]
    }
  ]
  tags = {
    terraform = true
  }
}
