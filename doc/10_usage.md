## Usage

```hcl
#####################
######SQS Queue######

module "terraform_sqs_queue" {
  source  = "./modules/terraform-aws-sqs"
  name                       = "${var.name}"
  visibility_timeout_seconds = "${var.visibility_timeout_seconds}"
  max_message_size           = "${var.max_message_size}"
  message_retention_seconds  = "${var.message_retention_seconds}"
  delay_seconds              = "${var.delay_seconds}"
}

###############################
######SQS With fifo_queue######

module "terraform_fifo_queue" {
  source                      = "./modules/terraform-aws-sqs"
  name                        = "${var.name}"
  fifo_queue                  = true
  content_based_deduplication = "${var.content_based_deduplication}"
  delay_seconds               = "${var.delay_seconds}"
  max_message_size            = "${var.max_message_size}"
  message_retention_seconds   = "${var.message_retention_seconds}"
  receive_wait_time_seconds   = "${var.receive_wait_time_seconds}"
  tags                        = "${var.tags}"
}

#################################################
######SQS With Server-side encryption (SSE)######

module "terraform_sse_queue" {
  name                              = "${var.name}"
  kms_master_key_id                 = "${var.kms_master_key_id}"
  kms_data_key_reuse_period_seconds = "${var.kms_data_key_reuse_period_seconds}"
  delay_seconds                     = "${var.delay_seconds}"
  max_message_size                  = "${var.max_message_size}"
  message_retention_seconds         = "${var.message_retention_seconds}"
  receive_wait_time_seconds         = "${var.receive_wait_time_seconds}"
  tags                              = "${var.tags}"
  has_sse                           = "true"
}

```
