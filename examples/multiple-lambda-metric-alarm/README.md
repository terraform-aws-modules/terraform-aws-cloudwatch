# Cloudwatch metric alarms for AWS Lambda example

Configuration in this directory creates Cloudwatch metric alarms for AWS Lambda. One metric alarm is based on `metric_name` defined by AWS Lambda service, another metric alarm is based on `metric_query` which monitors error rates (number of errors divided by the number of invocations).

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
| this\_cloudwatch\_metric\_alarm\_arns | List of ARN of the Cloudwatch metric alarms |
| this\_cloudwatch\_metric\_alarm\_ids | List of ID of the Cloudwatch metric alarms |
| this\_lambda\_function1\_arn | n/a |
| this\_lambda\_function1\_name | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
