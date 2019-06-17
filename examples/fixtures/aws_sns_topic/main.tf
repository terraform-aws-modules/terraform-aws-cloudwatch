resource "random_pet" "this" {
  length = 2
}

resource "aws_sns_topic" "this" {
  name = "fixtures-${random_pet.this.id}"
}

output "this_sns_topic_arn" {
  value = aws_sns_topic.this.arn
}

output "this_sns_topic_name" {
  value = aws_sns_topic.this.name
}
