resource "random_pet" "this" {
  length = 2
}

resource "aws_kms_key" "this" {
  description = "fixtures-${random_pet.this.id}"

}

output "this_kms_key_id" {
  value = aws_kms_key.this.key_id
}
