variable "create" {
  description = "Whether to create the Cloudwatch metric stream."
  type        = bool
  default     = true
}

variable "name" {
  description = "Friendly name of the metric stream. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix."
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "Creates a unique friendly name beginning with the specified prefix. Conflicts with name."
  type        = string
  default     = null
}

variable "firehose_arn" {
  description = "ARN of the Amazon Kinesis Firehose delivery stream to use for this metric stream."
  type        = string
}

variable "role_arn" {
  description = "ARN of the IAM role that this metric stream will use to access Amazon Kinesis Firehose resources."
  type        = string
}

variable "output_format" {
  description = " Output format for the stream. Possible values are json, opentelemetry0.7, and opentelemetry1.0"
  type        = string
}

variable "exclude_filter" {
  description = "Map of exclusive metric filters. If you specify this parameter, the stream sends metrics from all metric namespaces except for the namespaces and the conditional metric names that you specify here. If you don't specify metric names or provide empty metric names whole metric namespace is excluded. Conflicts with include_filter."
  type        = any
  default     = {}
}

variable "include_filter" {
  description = "Map of inclusive metric filters. If you specify this parameter, the stream sends only the conditional metric names from the metric namespaces that you specify here. If you don't specify metric names or provide empty metric names whole metric namespace is included. Conflicts with exclude_filter."
  type        = any
  default     = {}
}

variable "statistics_configuration" {
  description = "Map of statistics configuration."
  type        = any
  default     = []
}

variable "tags" {
  description = "A map of tags to add to the Cloudwatch Metric Stream."
  type        = map(string)
  default     = {}
}
