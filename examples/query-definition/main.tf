provider "aws" {
  region = "eu-west-1"
}

module "log_group" {
  source = "../../modules/log-group"

  name_prefix       = "my-log-group-"
  retention_in_days = 7
}

module "query_definition" {
  source = "../../modules/query-definition"

  name = "query-example"
  log_group_names = [
    module.log_group.cloudwatch_log_group_name
  ]
  query_string = <<EOF
fields @timestamp, @message
| sort @timestamp desc
| limit 25
EOF
}
