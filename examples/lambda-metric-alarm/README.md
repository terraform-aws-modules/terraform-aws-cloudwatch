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

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
