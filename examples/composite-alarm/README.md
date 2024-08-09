# Cloudwatch composite alarm

Configuration in this directory creates several Cloudwatch alarms including a Cloudwatch composite alarm, metric alarms for AWS Lambda, and a suppression alarm.

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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.58 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_all_lambdas_errors_alarm"></a> [all\_lambdas\_errors\_alarm](#module\_all\_lambdas\_errors\_alarm) | ../../modules/metric-alarm | n/a |
| <a name="module_aws_lambda_function1"></a> [aws\_lambda\_function1](#module\_aws\_lambda\_function1) | ../fixtures/aws_lambda_function | n/a |
| <a name="module_aws_sns_topic_1"></a> [aws\_sns\_topic\_1](#module\_aws\_sns\_topic\_1) | ../fixtures/aws_sns_topic | n/a |
| <a name="module_aws_sns_topic_2"></a> [aws\_sns\_topic\_2](#module\_aws\_sns\_topic\_2) | ../fixtures/aws_sns_topic | n/a |
| <a name="module_composite_alarm"></a> [composite\_alarm](#module\_composite\_alarm) | ../../modules/composite-alarm | n/a |
| <a name="module_lambda_duration_alarm"></a> [lambda\_duration\_alarm](#module\_lambda\_duration\_alarm) | ../../modules/metric-alarm | n/a |
| <a name="module_suppressor"></a> [suppressor](#module\_suppressor) | ../../modules/metric-alarm | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_composite_alarm_arn"></a> [cloudwatch\_composite\_alarm\_arn](#output\_cloudwatch\_composite\_alarm\_arn) | The ARN of the Cloudwatch composite alarm |
| <a name="output_cloudwatch_composite_alarm_id"></a> [cloudwatch\_composite\_alarm\_id](#output\_cloudwatch\_composite\_alarm\_id) | The ID of the Cloudwatch composite alarm |
| <a name="output_lambda_function1_arn"></a> [lambda\_function1\_arn](#output\_lambda\_function1\_arn) | Lambda function ARN |
| <a name="output_lambda_function1_name"></a> [lambda\_function1\_name](#output\_lambda\_function1\_name) | Lambda function name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->__
