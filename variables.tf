##Variables for sqs

variable "name" {
  type        = "string"
  description = "This is the human-readable name of the queue. If omitted, Terraform will assign a random name."
  default     = ""
}

variable "name_prefix" {
  type        = "string"
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  default     = ""
}

variable "visibility_timeout_seconds" {
  type        = "string"
  description = "The visibility timeout for the queue. An integer from 0 to 43200 (12 hours). The default for this attribute is 30. For more information about visibility timeout"
  default     = ""
}

variable "message_retention_seconds" {
  type        = "string"
  description = "The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days). The default for this attribute is 345600 (4 days)."
  default     = ""
}

variable "max_message_size" {
  type        = "string"
  description = "The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB). The default for this attribute is 262144 (256 KiB)"
  default     = ""
}

variable "delay_seconds" {
  type        = "string"
  description = "The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes). The default for this attribute is 0 seconds"
  default     = 0
}

variable "receive_wait_time_seconds" {
  type        = "string"
  description = "The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds). The default for this attribute is 0, meaning that the call will return immediately."
  default     = "0"
}

variable "policy" {
  type        = "map"
  description = "The JSON policy for the SQS queue. For more information about building AWS IAM policy documents with Terraform"
  default     = {}
}

variable "redrive_policy" {
  type        = "string"
  description = "The JSON policy to set up the Dead Letter Queue, see AWS docs. Note: when specifying maxReceiveCount, you must specify it as an integer (5), and not a string (Quotation mark 5 Quotation mark)."
  default     = ""
}

variable "tags" {
  type        = "map"
  description = "A mapping of tags to assign to the queue."
  default     = {}
}

################################
######variables for FIFO########

variable "fifo_queue" {
  type        = "string"
  description = "Boolean designating a FIFO queue. If not set, it defaults to false making it standard."
  default     = "false"
}

variable "content_based_deduplication" {
  type        = "string"
  description = "Enables content-based deduplication for FIFO queues. For more information"
  default     = "false"
}

#############################
######Variables for SSE######

variable "kms_master_key_id" {
  type        = "string"
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK. For more information"
  default     = ""
}

variable "kms_data_key_reuse_period_seconds" {
  type        = "string"
  description = "The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours). The default is 300 (5 minutes)."
  default     = ""
}

variable "has_sse" {
  type        = "string"
  description = "true or false if you need sse"
  default     = "false"
}
