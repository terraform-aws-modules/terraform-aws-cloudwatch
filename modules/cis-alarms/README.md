# CIS AWS Foundations Controls

Read more about [CIS AWS Foundations Controls](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-cis-controls.html) and stay secure.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.55 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.55 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_metric_filter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_metric_alarm.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [random_pet.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_actions_enabled"></a> [actions\_enabled](#input\_actions\_enabled) | Indicates whether or not actions should be executed during any changes to the alarm's state. | `bool` | `true` | no |
| <a name="input_alarm_actions"></a> [alarm\_actions](#input\_alarm\_actions) | List of ARNs to put as Cloudwatch Alarms actions (eg, ARN of SNS topic) | `list(string)` | `[]` | no |
| <a name="input_create"></a> [create](#input\_create) | Whether to create the Cloudwatch log metric filter and metric alarms | `bool` | `true` | no |
| <a name="input_disabled_controls"></a> [disabled\_controls](#input\_disabled\_controls) | List of IDs of disabled CIS controls | `list(string)` | `[]` | no |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | The name of the log group to associate the metric filter with | `string` | `""` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The namespace where metric filter and metric alarm should be cleated | `string` | `"CISBenchmark"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources | `map(string)` | `{}` | no |
| <a name="input_use_random_name_prefix"></a> [use\_random\_name\_prefix](#input\_use\_random\_name\_prefix) | Whether to prefix resource names with random prefix | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_metric_alarm_arns"></a> [cloudwatch\_metric\_alarm\_arns](#output\_cloudwatch\_metric\_alarm\_arns) | List of ARNs of the Cloudwatch metric alarm |
| <a name="output_cloudwatch_metric_alarm_ids"></a> [cloudwatch\_metric\_alarm\_ids](#output\_cloudwatch\_metric\_alarm\_ids) | List of IDs of the Cloudwatch metric alarm |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
