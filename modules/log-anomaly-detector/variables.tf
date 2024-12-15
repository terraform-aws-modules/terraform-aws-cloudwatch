variable "create" {
  description = "Whether to create the anomaly detector."
  type        = bool
  default     = true
}

variable "log_group_arns" {
  description = "Array containing the ARN of the log group that this anomaly detector will watch. You can specify only one log group ARN."
  type        = list(string)
  default     = null
}

variable "anomaly_visibility_time" {
  description = "Number of days to have visibility on an anomaly. After this time period has elapsed for an anomaly, it will be automatically baselined and the anomaly detector will treat new occurrences of a similar anomaly as normal. Therefore, if you do not correct the cause of an anomaly during the time period specified in anomaly_visibility_time, it will be considered normal going forward and will not be detected as an anomaly. Valid Range: Minimum value of 7. Maximum value of 90."
  type        = number
  default     = null
}

variable "detector_name" {
  description = "Name for this anomaly detector."
  type        = string
  default     = null
}

variable "enabled" {
  description = "Whether or not to enable the anomaly detector."
  type        = bool
  default     = null
}

variable "evaluation_frequency" {
  description = "Specifies how often the anomaly detector is to run and look for anomalies. Set this value according to the frequency that the log group receives new logs. For example, if the log group receives new log events every 10 minutes, then 15 minutes might be a good setting for evaluation_frequency. Valid Values: ONE_MIN | FIVE_MIN | TEN_MIN | FIFTEEN_MIN | THIRTY_MIN | ONE_HOUR."
  type        = string
  default     = null
}

variable "filter_pattern" {
  description = "You can use this parameter to limit the anomaly detection model to examine only log events that match the pattern you specify here."
  type        = string
  default     = null
}

variable "kms_key_id" {
  description = "Optionally assigns a AWS KMS key to secure this anomaly detector and its findings. If a key is assigned, the anomalies found and the model used by this detector are encrypted at rest with the key. If a key is assigned to an anomaly detector, a user must have permissions for both this key and for the anomaly detector to retrieve information about the anomalies that it finds."
  type        = string
  default     = null
}
