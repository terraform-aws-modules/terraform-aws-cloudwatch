provider "aws" {
  region = local.region
}

data "aws_caller_identity" "current" {}

locals {
  region = "eu-west-1"
  name   = "ex-${basename(path.cwd)}"
}

################################################################################
# CloudWatch Logs Resource Policy
################################################################################

# EventBridge writes to a log group through a resource policy on the CloudWatch
# Logs side, not through an execution role on the target. Without this, a rule
# matches its events and delivers nothing.
# https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-use-resource-based.html
module "eventbridge_log_resource_policy" {
  source = "../../modules/log-resource-policy"

  policy_name = local.name

  service_principals = [
    "events.amazonaws.com",
    "delivery.logs.amazonaws.com",
  ]

  log_group_arn_patterns = [
    "arn:aws:logs:${local.region}:${data.aws_caller_identity.current.account_id}:log-group:/aws/events/*:*",
  ]

  # Optional, and worth setting: without it the policy authorises the service in
  # general rather than the rules in this account.
  source_arn_patterns = [
    "arn:aws:events:${local.region}:${data.aws_caller_identity.current.account_id}:rule/*",
  ]
}

################################################################################
# A log group the policy covers
################################################################################

module "log_group" {
  source = "../../modules/log-group"

  name              = "/aws/events/${local.name}"
  retention_in_days = 7
}
