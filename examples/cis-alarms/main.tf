provider "aws" {
  region = "eu-west-1"
}

module "aws_sns_topic" {
  source = "../fixtures/aws_sns_topic"
}

module "second_aws_sns_topic" {
  source = "../fixtures/aws_sns_topic"
}

module "log" {
  source = "../fixtures/aws_cloudwatch_log_group"
}

module "all_cis_alarms" {
  source = "../../modules/cis-alarms"

  disabled_controls = ["DisableOrDeleteCMK", "VPCChanges"]

  log_group_name = module.log.cloudwatch_log_group_name
  alarm_actions  = [module.aws_sns_topic.sns_topic_arn]
}

# These alarms won't be created
module "disabled_all_cis_alarms" {
  source = "../../modules/cis-alarms"

  create = false

  use_random_name_prefix = true

  log_group_name = module.log.cloudwatch_log_group_name
  alarm_actions  = [module.aws_sns_topic.sns_topic_arn]
}

module "control_overrides" {
  source = "../../modules/cis-alarms"

  log_group_name = module.log.cloudwatch_log_group_name
  alarm_actions  = [module.aws_sns_topic.sns_topic_arn]

  control_overrides = {
    NoMFAConsoleSignin = {
      pattern = "{($.eventName=\"ConsoleLogin\") && ($.additionalEventData.MFAUsed != \"Yes\") && ($.userIdentity.sessionContext.sessionIssuer.arn != \"arn:aws:iam::*:role/aws-reserved/sso.amazonaws.com/*\")}"
    }

    AWSOrganizationsChanges = {
      alarm_actions = [module.second_aws_sns_topic.sns_topic_arn]
    }
  }
}
