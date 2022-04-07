provider "aws" {
  region = "eu-west-1"
}

module "log_group" {
  source = "../../modules/log-group"

  name_prefix       = "my-log-group-"
  retention_in_days = 7
}

module "log_stream" {
  source = "../../modules/log-stream"

  name           = "my-log-stream"
  log_group_name = module.log_group.cloudwatch_log_group_name
}
