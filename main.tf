########################

resource "aws_sqs_queue" "terraform_queue" {
  name                      = "${var.name}"
  delay_seconds             = "${var.delay_seconds}"
  max_message_size          = "${var.max_message_size}"
  message_retention_seconds = "${var.message_retention_seconds}"
  receive_wait_time_seconds = "${var.receive_wait_time_seconds}"
  tags                      = "${var.tags}"
}

##########################With fifo_queue

resource "aws_sqs_queue" "terraform_fifo_queue" {
  count                       = "${ var.fifo_queue ? 1 : 0}"
  name                        = "terraform-example-queue.fifo"
  fifo_queue                  = "${var.fifo_queue}"
  content_based_deduplication = "${var.content_based_deduplication}"
  delay_seconds               = "${var.delay_seconds}"
  max_message_size            = "${var.max_message_size}"
  message_retention_seconds   = "${var.message_retention_seconds}"
  receive_wait_time_seconds   = "${var.receive_wait_time_seconds}"
  tags                        = "${var.tags}"
}

########################With Server-side encryption (SSE)

resource "aws_sqs_queue" "terraform_sse_queue" {
  count                             = "${var.has_sse ? 1 : 0}"
  name                              = "terraform-example-queue"
  kms_master_key_id                 = "${var.kms_master_key_id}"
  kms_data_key_reuse_period_seconds = "${var.kms_data_key_reuse_period_seconds}"
  delay_seconds                     = "${var.delay_seconds}"
  max_message_size                  = "${var.max_message_size}"
  message_retention_seconds         = "${var.message_retention_seconds}"
  receive_wait_time_seconds         = "${var.receive_wait_time_seconds}"
  tags                              = "${var.tags}"
}
