provider "aws" {
  region = "eu-west-1"
}

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

  log_account_policy_name = "account-data-protection"
  log_account_policy_type = "DATA_PROTECTION_POLICY"

  # custom data identifier not yet supported by the data source for aws_cloudwatch_log_data_protection_policy within the module
  # specify your own json policy document if this is needed using policy_document argument
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
      RoleArn        = module.cw_logs_to_firehose_iam_role.arn
    }
  )
  log_account_policy_selection_criteria = "LogGroupName NOT IN [\"${module.excluded_log_group.cloudwatch_log_group_name}\"]"

  depends_on = [
    aws_kinesis_firehose_delivery_stream.logs,
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
