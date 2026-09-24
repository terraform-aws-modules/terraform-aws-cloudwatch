# log-resource-policy

Creates a CloudWatch Logs resource policy — the account-level policy that lets an
AWS service write into log groups.

Some services deliver logs through a resource policy on the CloudWatch Logs side
rather than through an execution role on their own side. EventBridge is one of
them, and the documentation is explicit about it:

> For Amazon CloudWatch Logs resources, EventBridge uses resource-based policies.
> [...] For Amazon CloudWatch Logs targets, do not specify a `RoleArn` in the
> target configuration.
>
> — [Using resource-based policies for EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-use-resource-based.html)

Without the policy the rule matches its events and delivers nothing, and no error
surfaces anywhere.

A resource policy is **account-wide and keyed by name**, not attached to a single
log group: the resource list is normally a prefix pattern, and writing a second
policy under the same name replaces the first.

## Usage

```hcl
module "eventbridge_log_resource_policy" {
  source = "terraform-aws-modules/cloudwatch/aws//modules/log-resource-policy"

  policy_name = "EventBridgeToCWLogs"

  service_principals = [
    "events.amazonaws.com",
    "delivery.logs.amazonaws.com",
  ]

  log_group_arn_patterns = [
    "arn:aws:logs:eu-west-1:111122223333:log-group:/aws/events/*:*",
  ]

  # Optional, and worth setting: without it the policy authorises the service in
  # general rather than the rules in this account.
  source_arn_patterns = [
    "arn:aws:events:eu-west-1:111122223333:rule/*",
  ]
}
```

Pass `policy_document` to supply a document as-is and skip the generated one.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.81 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.81 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_cloudwatch_log_resource_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_resource_policy) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_actions"></a> [actions](#input\_actions) | Actions to allow. The default is what a service needs in order to deliver logs into a group | `list(string)` | <pre>[<br/>  "logs:CreateLogStream",<br/>  "logs:PutLogEvents"<br/>]</pre> | no |
| <a name="input_create"></a> [create](#input\_create) | Controls if resources should be created | `bool` | `true` | no |
| <a name="input_log_group_arn_patterns"></a> [log\_group\_arn\_patterns](#input\_log\_group\_arn\_patterns) | Log group ARNs the policy applies to. A resource policy is account-wide, so these are usually prefix patterns such as `arn:aws:logs:eu-west-1:111122223333:log-group:/aws/events/*:*` | `list(string)` | `[]` | no |
| <a name="input_policy_document"></a> [policy\_document](#input\_policy\_document) | A complete policy document to use as-is. Leave `null` to build one from the arguments below | `string` | `null` | no |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | Name of the resource policy. Resource policies are account-wide and keyed by name, so writing a second policy under the same name replaces the first | `string` | n/a | yes |
| <a name="input_service_principals"></a> [service\_principals](#input\_service\_principals) | Service principals allowed to write, e.g. `events.amazonaws.com` for EventBridge rule targets or `delivery.logs.amazonaws.com` for vended log delivery | `list(string)` | `[]` | no |
| <a name="input_sid"></a> [sid](#input\_sid) | Statement ID for the generated policy document | `string` | `"AllowServiceToWriteLogs"` | no |
| <a name="input_source_arn_patterns"></a> [source\_arn\_patterns](#input\_source\_arn\_patterns) | Optional `aws:SourceArn` ArnLike condition values. Scoping to the calling resources, e.g. `arn:aws:events:eu-west-1:111122223333:rule/*`, keeps the policy from being usable as a confused deputy from another account | `list(string)` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_policy_document"></a> [policy\_document](#output\_policy\_document) | Policy document applied to the CloudWatch Logs resource policy |
| <a name="output_policy_name"></a> [policy\_name](#output\_policy\_name) | Name of the CloudWatch Logs resource policy |
<!-- END_TF_DOCS -->
