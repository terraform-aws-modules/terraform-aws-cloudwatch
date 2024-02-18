# composite-alarm

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.12 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_composite_alarm.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_composite_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_actions_enabled"></a> [actions\_enabled](#input\_actions\_enabled) | Indicates whether or not actions should be executed during any changes to the composite alarm's state. Defaults to true. | `bool` | `true` | no |
| <a name="input_actions_suppressor"></a> [actions\_suppressor](#input\_actions\_suppressor) | A map of actions suppressor alarm configurations. | `map(any)` | `{}` | no |
| <a name="input_alarm_actions"></a> [alarm\_actions](#input\_alarm\_actions) | The set of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN). Up to 5 actions are allowed. | `list(string)` | `null` | no |
| <a name="input_alarm_description"></a> [alarm\_description](#input\_alarm\_description) | The description for the composite alarm. | `string` | `null` | no |
| <a name="input_alarm_name"></a> [alarm\_name](#input\_alarm\_name) | The descriptive name for the composite alarm. This name must be unique within the region. | `string` | `null` | no |
| <a name="input_alarm_rule"></a> [alarm\_rule](#input\_alarm\_rule) | An expression that specifies which other alarms are to be evaluated to determine this composite alarm's state. The maximum length is 10240 characters. | `string` | `null` | no |
| <a name="input_create"></a> [create](#input\_create) | Whether to create the Cloudwatch composite alarm | `bool` | `true` | no |
| <a name="input_insufficient_data_actions"></a> [insufficient\_data\_actions](#input\_insufficient\_data\_actions) | The set of actions to execute when this alarm transitions into an INSUFFICIENT\_DATA state from any other state. Each action is specified as an Amazon Resource Name (ARN). Up to 5 actions are allowed. | `list(string)` | `null` | no |
| <a name="input_ok_actions"></a> [ok\_actions](#input\_ok\_actions) | The set of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Name (ARN). Up to 5 actions are allowed. | `list(string)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_composite_alarm_arn"></a> [cloudwatch\_composite\_alarm\_arn](#output\_cloudwatch\_composite\_alarm\_arn) | The ARN of the Cloudwatch composite alarm. |
| <a name="output_cloudwatch_composite_alarm_id"></a> [cloudwatch\_composite\_alarm\_id](#output\_cloudwatch\_composite\_alarm\_id) | The ID of the Cloudwatch composite alarm. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
