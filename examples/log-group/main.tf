provider "aws" {
  region = "eu-west-1"
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

module "basic_example" {
  source = "../../modules/log-group"

  name = "basic-example"
}

module "advanced_example" {
  source = "../../modules/log-group"

  name = "example-with-policy"

  resource_policies = {
    custom = data.aws_iam_policy_document.custom.json
  }
  allowed_service_ids = ["es", "lambda"]
}

data "aws_iam_policy_document" "custom" {
  statement {
    sid = "AllowElasticSearchLogs"
    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.current.account_id]
    }
    actions = [
      "logs:PutLogEvents",
      "logs:CreateLogStream",
    ]
    resources = ["arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:example-with-policy/*"]
  }
}
