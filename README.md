
# terraform-aws-sqs

Terraform module which creates SQS resources on AWS.

Terraform module that creates SQS resources in AWS, also of fifo_queue and SSE types
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

## README.md
This README file was created runnnign generate-readme.sh placed insinde hooks directory.
If you want to update README.md file, run that script while being in 'hooks' folder.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| content\_based\_deduplication | Enables content-based deduplication for FIFO queues. For more information | string | `"false"` | no |
| delay\_seconds | The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes). The default for this attribute is 0 seconds | string | `"0"` | no |
| fifo\_queue | Boolean designating a FIFO queue. If not set, it defaults to false making it standard. | string | `"false"` | no |
| has\_sse | true or false if you need sse | string | `"false"` | no |
| kms\_data\_key\_reuse\_period\_seconds | The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours). The default is 300 (5 minutes). | string | `""` | no |
| kms\_master\_key\_id | The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK. For more information | string | `""` | no |
| max\_message\_size | The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB). The default for this attribute is 262144 (256 KiB) | string | `""` | no |
| message\_retention\_seconds | The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days). The default for this attribute is 345600 (4 days). | string | `""` | no |
| name | This is the human-readable name of the queue. If omitted, Terraform will assign a random name. | string | `""` | no |
| name\_prefix | Creates a unique name beginning with the specified prefix. Conflicts with name | string | `""` | no |
| policy | The JSON policy for the SQS queue. For more information about building AWS IAM policy documents with Terraform | map | `<map>` | no |
| receive\_wait\_time\_seconds | The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds). The default for this attribute is 0, meaning that the call will return immediately. | string | `"0"` | no |
| redrive\_policy | The JSON policy to set up the Dead Letter Queue, see AWS docs. Note: when specifying maxReceiveCount, you must specify it as an integer (5), and not a string (Quotation mark 5 Quotation mark). | string | `""` | no |
| tags | A mapping of tags to assign to the queue. | map | `<map>` | no |
| visibility\_timeout\_seconds | The visibility timeout for the queue. An integer from 0 to 43200 (12 hours). The default for this attribute is 30. For more information about visibility timeout | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the SQS queue |

