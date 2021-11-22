# CIS AWS Foundations Controls - complete example

Configuration in this directory creates Cloudwatch metric alarms as described in [CIS AWS Foundations Controls](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-cis-controls.html).

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.55 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_all_cis_alarms"></a> [all\_cis\_alarms](#module\_all\_cis\_alarms) | ../../modules/cis-alarms | n/a |
| <a name="module_aws_sns_topic"></a> [aws\_sns\_topic](#module\_aws\_sns\_topic) | ../fixtures/aws_sns_topic | n/a |
| <a name="module_disabled_all_cis_alarms"></a> [disabled\_all\_cis\_alarms](#module\_disabled\_all\_cis\_alarms) | ../../modules/cis-alarms | n/a |
| <a name="module_log"></a> [log](#module\_log) | ../fixtures/aws_cloudwatch_log_group | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_metric_alarm_arns"></a> [cloudwatch\_metric\_alarm\_arns](#output\_cloudwatch\_metric\_alarm\_arns) | List of ARNs of the Cloudwatch metric alarm |
| <a name="output_cloudwatch_metric_alarm_ids"></a> [cloudwatch\_metric\_alarm\_ids](#output\_cloudwatch\_metric\_alarm\_ids) | List of IDs of the Cloudwatch metric alarm |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
