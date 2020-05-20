locals {
  all_controls = {
    UnauthorizedAPICalls = {
      pattern     = "{ ($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\") }"
      description = "Monitoring changes to security group will help ensure that resources and services are not unintentionally exposed."
    }

    NoMFAConsoleSignin = {
      pattern     = "{ ($.eventName = \"ConsoleLogin\") && ($.additionalEventData.MFAUsed != \"Yes\") }"
      description = "Monitoring for single-factor console logins will increase visibility into accounts that are not protected by MFA."
    }

    RootUsage = {
      pattern     = "{ $.userIdentity.type = \"Root\" && $.userIdentity.invokedBy NOT EXISTS && $.eventType != \"AwsServiceEvent\" }"
      description = "Monitoring for root account logins will provide visibility into the use of a fully privileged account and an opportunity to reduce the use of it."
    }

    IAMChanges = {
      pattern     = "{($.eventName=DeleteGroupPolicy)||($.eventName=DeleteRolePolicy)||($.eventName=DeleteUserPolicy)||($.eventName=PutGroupPolicy)||($.eventName=PutRolePolicy)||($.eventName=PutUserPolicy)||($.eventName=CreatePolicy)||($.eventName=DeletePolicy)||($.eventName=CreatePolicyVersion)||($.eventName=DeletePolicyVersion)||($.eventName=AttachRolePolicy)||($.eventName=DetachRolePolicy)||($.eventName=AttachUserPolicy)||($.eventName=DetachUserPolicy)||($.eventName=AttachGroupPolicy)||($.eventName=DetachGroupPolicy)}"
      description = "Monitoring changes to IAM policies will help ensure authentication and authorization controls remain intact."
    }

    CloudTrailCfgChanges = {
      pattern     = "{ ($.eventName = CreateTrail) || ($.eventName = UpdateTrail) || ($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName = StopLogging) }"
      description = "Monitoring changes to CloudTrail's configuration will help ensure sustained visibility to activities performed in the AWS account."
    }


    ConsoleSigninFailures = {
      pattern     = "{ ($.eventName = ConsoleLogin) && ($.errorMessage = \"Failed authentication\") }"
      description = "Monitoring failed console logins may decrease lead time to detect an attempt to brute force a credential, which may provide an indicator, such as source IP, that can be used in other event correlation."
    }


    DisableOrDeleteCMK = {
      pattern     = "{ ($.eventSource = kms.amazonaws.com) && (($.eventName = DisableKey) || ($.eventName = ScheduleKeyDeletion)) }"
      description = "Monitoring failed console logins may decrease lead time to detect an attempt to brute force a credential, which may provide an indicator, such as source IP, that can be used in other event correlation."
    }

    S3BucketPolicyChanges = {
      pattern     = "{ ($.eventSource = s3.amazonaws.com) && (($.eventName = PutBucketAcl) || ($.eventName = PutBucketPolicy) || ($.eventName = PutBucketCors) || ($.eventName = PutBucketLifecycle) || ($.eventName = PutBucketReplication) || ($.eventName = DeleteBucketPolicy) || ($.eventName = DeleteBucketCors) || ($.eventName = DeleteBucketLifecycle) || ($.eventName = DeleteBucketReplication)) }"
      description = "Monitoring changes to S3 bucket policies may reduce time to detect and correct permissive policies on sensitive S3 buckets."
    }


    AWSConfigChanges = {
      pattern     = "{ ($.eventSource = config.amazonaws.com) && (($.eventName=StopConfigurationRecorder)||($.eventName=DeleteDeliveryChannel)||($.eventName=PutDeliveryChannel)||($.eventName=PutConfigurationRecorder)) }"
      description = "Monitoring changes to AWS Config configuration will help ensure sustained visibility of configuration items within the AWS account."
    }

    SecurityGroupChanges = {
      pattern     = "{ ($.eventName = AuthorizeSecurityGroupIngress) || ($.eventName = AuthorizeSecurityGroupEgress) || ($.eventName = RevokeSecurityGroupIngress) || ($.eventName = RevokeSecurityGroupEgress) || ($.eventName = CreateSecurityGroup) || ($.eventName = DeleteSecurityGroup)}"
      description = "Monitoring changes to security group will help ensure that resources and services are not unintentionally exposed."
    }

    NACLChanges = {
      pattern     = "{ ($.eventName = CreateNetworkAcl) || ($.eventName = CreateNetworkAclEntry) || ($.eventName = DeleteNetworkAcl) || ($.eventName = DeleteNetworkAclEntry) || ($.eventName = ReplaceNetworkAclEntry) || ($.eventName = ReplaceNetworkAclAssociation) }"
      description = "Monitoring changes to NACLs will help ensure that AWS resources and services are not unintentionally exposed."
    }

    NetworkGWChanges = {
      pattern     = "{ ($.eventName = CreateCustomerGateway) || ($.eventName = DeleteCustomerGateway) || ($.eventName = AttachInternetGateway) || ($.eventName = CreateInternetGateway) || ($.eventName = DeleteInternetGateway) || ($.eventName = DetachInternetGateway) }"
      description = "Monitoring changes to network gateways will help ensure that all ingress/egress traffic traverses the VPC border via a controlled path."
    }

    RouteTableChanges = {
      pattern     = "{ ($.eventName = CreateRoute) || ($.eventName = CreateRouteTable) || ($.eventName = ReplaceRoute) || ($.eventName = ReplaceRouteTableAssociation) || ($.eventName = DeleteRouteTable) || ($.eventName = DeleteRoute) || ($.eventName = DisassociateRouteTable) }"
      description = "Monitoring changes to route tables will help ensure that all VPC traffic flows through an expected path."
    }

    VPCChanges = {
      pattern     = "{ ($.eventName = CreateVpc) || ($.eventName = DeleteVpc) || ($.eventName = ModifyVpcAttribute) || ($.eventName = AcceptVpcPeeringConnection) || ($.eventName = CreateVpcPeeringConnection) || ($.eventName = DeleteVpcPeeringConnection) || ($.eventName = RejectVpcPeeringConnection) || ($.eventName = AttachClassicLinkVpc) || ($.eventName = DetachClassicLinkVpc) || ($.eventName = DisableVpcClassicLink) || ($.eventName = EnableVpcClassicLink) }"
      description = "Monitoring changes to VPC will help ensure that all VPC traffic flows through an expected path."
    }

  }

  ###############

  prefix   = var.use_random_name_prefix ? "${random_pet.this[0].id}-" : ""
  controls = { for k, v in local.all_controls : k => v if ! contains(var.disabled_controls, k) }
}

resource "random_pet" "this" {
  count = var.use_random_name_prefix ? 1 : 0

  length = 2
}

resource "aws_cloudwatch_log_metric_filter" "this" {
  for_each = var.create ? local.controls : {}

  name           = "${local.prefix}${each.key}"
  pattern        = each.value["pattern"]
  log_group_name = lookup(each.value, "log_group_name", var.log_group_name)

  metric_transformation {
    name          = each.key
    namespace     = lookup(each.value, "namespace", var.namespace)
    value         = 1
    default_value = 0
  }
}

resource "aws_cloudwatch_metric_alarm" "this" {
  for_each = var.create ? local.controls : {}

  metric_name       = aws_cloudwatch_log_metric_filter.this[each.key].id
  namespace         = lookup(each.value, "namespace", var.namespace)
  alarm_name        = "${local.prefix}${each.key}"
  alarm_description = lookup(each.value, "description", null)

  actions_enabled           = lookup(each.value, "actions_enabled", var.actions_enabled)
  alarm_actions             = lookup(each.value, "alarm_actions", var.alarm_actions)
  ok_actions                = lookup(each.value, "ok_actions", null)
  insufficient_data_actions = lookup(each.value, "insufficient_data_actions", null)

  comparison_operator                   = lookup(each.value, "comparison_operator", "GreaterThanOrEqualToThreshold")
  evaluation_periods                    = lookup(each.value, "evaluation_periods", 1)
  threshold                             = lookup(each.value, "threshold", 1)
  unit                                  = lookup(each.value, "unit", null)
  datapoints_to_alarm                   = lookup(each.value, "datapoints_to_alarm", null)
  treat_missing_data                    = lookup(each.value, "treat_missing_data", "notBreaching")
  evaluate_low_sample_count_percentiles = lookup(each.value, "evaluate_low_sample_count_percentiles", null)

  period     = lookup(each.value, "period", 300)
  statistic  = lookup(each.value, "statistic", "Sum")
  dimensions = lookup(each.value, "dimensions", null)

  tags = var.tags
}
