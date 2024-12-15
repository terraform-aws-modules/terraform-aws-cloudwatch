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
| <a name="module_cw_logs_to_firehose"></a> [cw\_logs\_to\_firehose](#module\_cw\_logs\_to\_firehose) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | ~> 5.0 |
| <a name="module_cw_logs_to_firehose_policy"></a> [cw\_logs\_to\_firehose\_policy](#module\_cw\_logs\_to\_firehose\_policy) | terraform-aws-modules/iam/aws//modules/iam-policy | ~> 5.0 |
| <a name="module_excluded_log_group"></a> [excluded\_log\_group](#module\_excluded\_log\_group) | ../../modules/log-group | n/a |
| <a name="module_firehose_to_s3"></a> [firehose\_to\_s3](#module\_firehose\_to\_s3) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | ~> 5.0 |
| <a name="module_firehose_to_s3_policy"></a> [firehose\_to\_s3\_policy](#module\_firehose\_to\_s3\_policy) | terraform-aws-modules/iam/aws//modules/iam-policy | ~> 5.0 |
| <a name="module_log_account_data_retention_policy"></a> [log\_account\_data\_retention\_policy](#module\_log\_account\_data\_retention\_policy) | ../../modules/log-account-policy | n/a |
| <a name="module_log_account_subscription_filter_policy"></a> [log\_account\_subscription\_filter\_policy](#module\_log\_account\_subscription\_filter\_policy) | ../../modules/log-account-policy | n/a |
| <a name="module_log_group"></a> [log\_group](#module\_log\_group) | ../../modules/log-group | n/a |
| <a name="module_logs_bucket"></a> [logs\_bucket](#module\_logs\_bucket) | terraform-aws-modules/s3-bucket/aws | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [aws_kinesis_firehose_delivery_stream.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [random_pet.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.custom_trust_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cw_logs_to_firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.firehose_to_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_log_account_data_retention_policy_name"></a> [log\_account\_data\_retention\_policy\_name](#output\_log\_account\_data\_retention\_policy\_name) | Name of Cloudwatch log account policy |
| <a name="output_log_account_subscription_filter_retention_policy_name"></a> [log\_account\_subscription\_filter\_retention\_policy\_name](#output\_log\_account\_subscription\_filter\_retention\_policy\_name) | Name of Cloudwatch log account policy |
<!-- END_TF_DOCS -->
