output "arn" {
  description = "The ARN of the SQS queue"
  value       = "${aws_sqs_queue.terraform_queue.arn}"
}
