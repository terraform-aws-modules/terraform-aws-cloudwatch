# Complete Cloudwatch log group and data protection policy

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.42 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_audit_destination_group"></a> [audit\_destination\_group](#module\_audit\_destination\_group) | ../../modules/log-group | n/a |
| <a name="module_log_data_protection_policy"></a> [log\_data\_protection\_policy](#module\_log\_data\_protection\_policy) | ../../modules/log-data-protection-policy | n/a |
| <a name="module_log_group"></a> [log\_group](#module\_log\_group) | ../../modules/log-group | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_log_group_arn"></a> [cloudwatch\_log\_group\_arn](#output\_cloudwatch\_log\_group\_arn) | ARN of Cloudwatch log group |
| <a name="output_cloudwatch_log_group_name"></a> [cloudwatch\_log\_group\_name](#output\_cloudwatch\_log\_group\_name) | Name of Cloudwatch log group |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
