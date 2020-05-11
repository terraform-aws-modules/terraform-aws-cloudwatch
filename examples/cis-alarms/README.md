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

No requirements.

## Providers

No provider.

## Inputs

No input.

## Outputs

| Name | Description |
|------|-------------|
| this\_cloudwatch\_metric\_alarm\_arns | List of ARNs of the Cloudwatch metric alarm |
| this\_cloudwatch\_metric\_alarm\_ids | List of IDs of the Cloudwatch metric alarm |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
