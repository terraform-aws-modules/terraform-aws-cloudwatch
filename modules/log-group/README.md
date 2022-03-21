# log-group

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.55 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.55 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_resource_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_resource_policy) | resource |
| [aws_iam_policy_document.allowed_services](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_service_actions"></a> [allowed\_service\_actions](#input\_allowed\_service\_actions) | The IAM actions to allow each service to perform | `list(string)` | <pre>[<br>  "logs:CreateLogStream",<br>  "logs:PutLogEvents",<br>  "logs:PutLogEventsBatch"<br>]</pre> | no |
| <a name="input_allowed_service_ids"></a> [allowed\_service\_ids](#input\_allowed\_service\_ids) | The IDs of AWS services that should be allowed to publish logs to this log-group.  Names should be the identifier for the AWS service principal minus the `.amazonaws.com`. For example, elasticsearch would be `es`.  Each service will become one of the resource policies attached and will recieve a policy name equal to the service identifier | `set(string)` | `[]` | no |
| <a name="input_create"></a> [create](#input\_create) | Whether to create the Cloudwatch log group | `bool` | `true` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN of the KMS Key to use when encrypting logs | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | A name for the log group | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | A name prefix for the log group | `string` | `null` | no |
| <a name="input_resource_policies"></a> [resource\_policies](#input\_resource\_policies) | The resource policies to attach to the Cloudwatch log group mapped name to document | `map(string)` | `{}` | no |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | Specifies the number of days you want to retain log events in the specified log group | `number` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to Cloudwatch log group | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_log_group_arn"></a> [cloudwatch\_log\_group\_arn](#output\_cloudwatch\_log\_group\_arn) | ARN of Cloudwatch log group |
| <a name="output_cloudwatch_log_group_name"></a> [cloudwatch\_log\_group\_name](#output\_cloudwatch\_log\_group\_name) | Name of Cloudwatch log group |
| <a name="output_cloudwatch_log_group_resource_policies"></a> [cloudwatch\_log\_group\_resource\_policies](#output\_cloudwatch\_log\_group\_resource\_policies) | IDs of Cloudwatch Resource Policies |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
