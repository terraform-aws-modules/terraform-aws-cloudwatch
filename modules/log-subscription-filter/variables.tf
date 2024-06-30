variable "create" {
  description = "Whether to create the Cloudwatch log stream"
  type        = bool
  default     = true
}

variable "name" {
  description = "A name for the log stream"
  type        = string
  default     = null
}

variable "destination_arn" {
  description = "The ARN of the destination to deliver matching log events to. Kinesis stream or Lambda function ARN"
  type        = string
  default     = null
}

variable "filter_pattern" {
  description = "A valid CloudWatch Logs filter pattern for subscribing to a filtered stream of log events. Use empty string to match everything"
  type        = string
  default     = ""
}

variable "log_group_name" {
  description = "The name of the log group to associate the subscription filter with"
  type        = string
  default     = null
}

variable "role_arn" {
  description = "The ARN of an IAM role that grants Amazon CloudWatch Logs permissions to deliver ingested log events to the destination"
  type        = string
  default     = null
}

variable "distribution" {
  description = "The method used to distribute log data to the destination. By default log data is grouped by log stream, but the grouping can be set to random for a more even distribution"
  type        = string
  default     = null
}
