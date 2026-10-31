# CloudWatch Logs Resource Policy

Configuration in this directory creates a CloudWatch Logs resource policy that
lets EventBridge deliver events into log groups under `/aws/events/`, together
with one such log group.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.81 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.81 |

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| <a name="module_eventbridge_log_resource_policy"></a> [eventbridge\_log\_resource\_policy](#module\_eventbridge\_log\_resource\_policy) | ../../modules/log-resource-policy | n/a |
| <a name="module_log_group"></a> [log\_group](#module\_log\_group) | ../../modules/log-group | n/a |

## Resources

| Name | Type |
| ---- | ---- |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_log_group_arn"></a> [log\_group\_arn](#output\_log\_group\_arn) | ARN of the log group the policy covers |
| <a name="output_policy_name"></a> [policy\_name](#output\_policy\_name) | Name of the CloudWatch Logs resource policy |
<!-- END_TF_DOCS -->
