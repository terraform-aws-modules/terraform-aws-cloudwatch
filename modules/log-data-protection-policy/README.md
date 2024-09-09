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
| [aws_cloudwatch_log_data_protection_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/cloudwatch_log_data_protection_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_audit_statement_sid"></a> [audit\_statement\_sid](#input\_audit\_statement\_sid) | Name of the audit statement. | `string` | `"audit-policy"` | no |
| <a name="input_create"></a> [create](#input\_create) | Whether to create the cloudwatch log data protection policy. | `bool` | `true` | no |
| <a name="input_create_log_data_protection_policy"></a> [create\_log\_data\_protection\_policy](#input\_create\_log\_data\_protection\_policy) | Whether to create the cloudwatch log data protection policy. | `bool` | `false` | no |
| <a name="input_data_identifiers"></a> [data\_identifiers](#input\_data\_identifiers) | Set of at least 1 sensitive data identifiers that you want to mask. | `list(string)` | `null` | no |
| <a name="input_deidentify_statement_sid"></a> [deidentify\_statement\_sid](#input\_deidentify\_statement\_sid) | Name of the deidentify statement. | `string` | `"redact-policy"` | no |
| <a name="input_findings_destination_cloudwatch_log_group"></a> [findings\_destination\_cloudwatch\_log\_group](#input\_findings\_destination\_cloudwatch\_log\_group) | Configures CloudWatch Logs as a findings destination. | `string` | `null` | no |
| <a name="input_findings_destination_firehose_delivery_stream"></a> [findings\_destination\_firehose\_delivery\_stream](#input\_findings\_destination\_firehose\_delivery\_stream) | Configures Kinesis Firehose as a findings destination. | `string` | `null` | no |
| <a name="input_findings_destination_s3_bucket"></a> [findings\_destination\_s3\_bucket](#input\_findings\_destination\_s3\_bucket) | Configures S3 as a findings destination. | `string` | `null` | no |
| <a name="input_log_data_protection_description"></a> [log\_data\_protection\_description](#input\_log\_data\_protection\_description) | The description of the data protection policy document. | `string` | `null` | no |
| <a name="input_log_data_protection_policy_name"></a> [log\_data\_protection\_policy\_name](#input\_log\_data\_protection\_policy\_name) | The name of the data protection policy document. | `string` | `null` | no |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | The name of the log group under which the log stream is to be created. | `string` | `null` | no |
| <a name="input_policy_document"></a> [policy\_document](#input\_policy\_document) | Specifies the data protection policy in JSON. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_log_group_name"></a> [log\_group\_name](#output\_log\_group\_name) | Name of Cloudwatch log group |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
