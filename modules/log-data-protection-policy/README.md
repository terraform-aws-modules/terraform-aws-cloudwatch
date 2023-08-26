# log-data-protection-policy

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
| [aws_cloudwatch_log_data_protection_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_data_protection_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Whether to create the cloudwatch log data protection policy. | `bool` | `true` | no |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | The name of the log group under which the log stream is to be created. | `string` | n/a | yes |
| <a name="input_policy_document"></a> [policy\_document](#input\_policy\_document) | Specifies the data protection policy in JSON. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_log_group_name"></a> [log\_group\_name](#output\_log\_group\_name) | Name of Cloudwatch log group |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
