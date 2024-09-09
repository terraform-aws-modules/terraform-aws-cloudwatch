provider "aws" {
  region = "eu-west-1"
}

module "log_group" {
  source = "../../modules/log-group"

  name_prefix       = "my-log-group-"
  retention_in_days = 7
}

module "custom_data_protection_policy_log_group" {
  source = "../../modules/log-group"

  name_prefix       = "my-custom-policy-log-group-"
  retention_in_days = 7
}


module "audit_destination_group" {
  source = "../../modules/log-group"

  name_prefix       = "audit-destination-log-group-"
  retention_in_days = 7
}

module "log_data_protection_policy" {
  source = "../../modules/log-data-protection-policy"

  log_group_name                    = module.log_group.cloudwatch_log_group_name
  create_log_data_protection_policy = true
  log_data_protection_policy_name   = "RedactAddress"

  data_identifiers                          = ["arn:aws:dataprotection::aws:data-identifier/Address"]
  findings_destination_cloudwatch_log_group = module.audit_destination_group.cloudwatch_log_group_name
}

module "custom_log_data_protection_policy" {
  source = "../../modules/log-data-protection-policy"

  log_group_name = module.custom_data_protection_policy_log_group.cloudwatch_log_group_name

  # custom data identifier not yet supported by the data source for aws_cloudwatch_log_data_protection_policy within the module
  # specify your own json policy document if this is needed
  # https://github.com/hashicorp/terraform-provider-aws/issues/35682
  policy_document = jsonencode({
    Name    = "RedactCustomerId"
    Version = "2021-06-01"

    Configuration = {
      CustomDataIdentifier = [
        {
          Name  = "CustomerId",
          Regex = "CustomerId-\\d{5}"
        }
      ]
    }

    Statement = [
      {
        Sid            = "Audit"
        DataIdentifier = ["CustomerId"]
        Operation = {
          Audit = {
            FindingsDestination = {
              CloudWatchLogs = {
                LogGroup = module.audit_destination_group.cloudwatch_log_group_name
              }
            }
          }
        }
      },
      {
        Sid            = "Redact"
        DataIdentifier = ["CustomerId"]
        Operation = {
          Deidentify = {
            MaskConfig = {}
          }
        }
      }
    ]
  })
}
