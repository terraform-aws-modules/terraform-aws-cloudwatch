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

# Wrappers (e.g. useful when using with Terragrunt)
module "log_group_wrapped" {
  source = "../../wrappers/log-group"

  items = {
    "one" = {
      name_prefix       = "my-log-group-wrapper1-"
      retention_in_days = 7
    }
    "two" = {
      name_prefix       = "my-log-group-wrapper2-"
      retention_in_days = 14
    }
  }

}

module "log_stream_wrapped" {
  source = "../../wrappers/log-stream"

  items = {
    "one1" = {
      name           = "my-log-stream1-1"
      log_group_name = module.log_group_wrapped.wrapper["one"].cloudwatch_log_group_name
    }
    "one2" = {
      name           = "my-log-stream1-2"
      log_group_name = module.log_group_wrapped.wrapper["one"].cloudwatch_log_group_name
    }
    "two" = {
      name           = "my-log-stream2"
      log_group_name = module.log_group_wrapped.wrapper["two"].cloudwatch_log_group_name
    }
  }
}
