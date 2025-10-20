# Complete Cloudwatch log account policy

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.81 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.81 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.5 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_audit_destination_group"></a> [audit\_destination\_group](#module\_audit\_destination\_group) | ../../modules/log-group | n/a |
| <a name="module_cw_logs_to_firehose_iam_role"></a> [cw\_logs\_to\_firehose\_iam\_role](#module\_cw\_logs\_to\_firehose\_iam\_role) | terraform-aws-modules/iam/aws//modules/iam-role | ~> 6.0 |
| <a name="module_excluded_log_group"></a> [excluded\_log\_group](#module\_excluded\_log\_group) | ../../modules/log-group | n/a |
| <a name="module_firehose_to_s3_iam_role"></a> [firehose\_to\_s3\_iam\_role](#module\_firehose\_to\_s3\_iam\_role) | terraform-aws-modules/iam/aws//modules/iam-role | ~> 6.0 |
| <a name="module_log_account_data_retention_policy"></a> [log\_account\_data\_retention\_policy](#module\_log\_account\_data\_retention\_policy) | ../../modules/log-account-policy | n/a |
| <a name="module_log_account_subscription_filter_policy"></a> [log\_account\_subscription\_filter\_policy](#module\_log\_account\_subscription\_filter\_policy) | ../../modules/log-account-policy | n/a |
| <a name="module_log_group"></a> [log\_group](#module\_log\_group) | ../../modules/log-group | n/a |
| <a name="module_logs_bucket"></a> [logs\_bucket](#module\_logs\_bucket) | terraform-aws-modules/s3-bucket/aws | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_kinesis_firehose_delivery_stream.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [random_pet.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_log_account_data_retention_policy_name"></a> [log\_account\_data\_retention\_policy\_name](#output\_log\_account\_data\_retention\_policy\_name) | Name of Cloudwatch log account policy |
| <a name="output_log_account_subscription_filter_retention_policy_name"></a> [log\_account\_subscription\_filter\_retention\_policy\_name](#output\_log\_account\_subscription\_filter\_retention\_policy\_name) | Name of Cloudwatch log account policy |
<!-- END_TF_DOCS -->
