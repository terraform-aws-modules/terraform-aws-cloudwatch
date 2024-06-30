# log-stream

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_subscription_filter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_subscription_filter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Whether to create the Cloudwatch log stream | `bool` | `true` | no |
| <a name="input_destination_arn"></a> [destination\_arn](#input\_destination\_arn) | The ARN of the destination to deliver matching log events to. Kinesis stream or Lambda function ARN | `string` | `null` | no |
| <a name="input_distribution"></a> [distribution](#input\_distribution) | The method used to distribute log data to the destination. By default log data is grouped by log stream, but the grouping can be set to random for a more even distribution | `string` | `null` | no |
| <a name="input_filter_pattern"></a> [filter\_pattern](#input\_filter\_pattern) | A valid CloudWatch Logs filter pattern for subscribing to a filtered stream of log events. Use empty string to match everything | `string` | `""` | no |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | The name of the log group to associate the subscription filter with | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | A name for the log stream | `string` | `null` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | The ARN of an IAM role that grants Amazon CloudWatch Logs permissions to deliver ingested log events to the destination | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_log_subscription_filter_name"></a> [cloudwatch\_log\_subscription\_filter\_name](#output\_cloudwatch\_log\_subscription\_filter\_name) | Log subscription filter name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
