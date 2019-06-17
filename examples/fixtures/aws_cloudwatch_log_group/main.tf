resource "random_pet" "this" {
  length = 2
}

resource "aws_cloudwatch_log_group" "this" {
  name = "log-group-${random_pet.this.id}"
}
