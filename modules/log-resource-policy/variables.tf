variable "create" {
  description = "Controls if resources should be created"
  type        = bool
  default     = true
}

variable "policy_name" {
  description = "Name of the resource policy. Resource policies are account-wide and keyed by name, so writing a second policy under the same name replaces the first"
  type        = string
}

variable "policy_document" {
  description = "A complete policy document to use as-is. Leave `null` to build one from the arguments below"
  type        = string
  default     = null
}

variable "service_principals" {
  description = "Service principals allowed to write, e.g. `events.amazonaws.com` for EventBridge rule targets or `delivery.logs.amazonaws.com` for vended log delivery"
  type        = list(string)
  default     = []
}

variable "actions" {
  description = "Actions to allow. The default is what a service needs in order to deliver logs into a group"
  type        = list(string)
  default     = ["logs:CreateLogStream", "logs:PutLogEvents"]
}

variable "log_group_arn_patterns" {
  description = "Log group ARNs the policy applies to. A resource policy is account-wide, so these are usually prefix patterns such as `arn:aws:logs:eu-west-1:111122223333:log-group:/aws/events/*:*`"
  type        = list(string)
  default     = []
}

variable "sid" {
  description = "Statement ID for the generated policy document"
  type        = string
  default     = "AllowServiceToWriteLogs"
}

variable "source_arn_patterns" {
  description = "Optional `aws:SourceArn` ArnLike condition values. Scoping to the calling resources, e.g. `arn:aws:events:eu-west-1:111122223333:rule/*`, keeps the policy from being usable as a confused deputy from another account"
  type        = list(string)
  default     = null
}
