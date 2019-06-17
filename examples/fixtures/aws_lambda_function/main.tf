resource "random_pet" "this" {
  length = 2
}

data "archive_file" "lambda" {
  type = "zip"

  source {
    content  = "def lambda_handler(event, context): \n    return event" # or: return event['Records'][0]
    filename = "index.py"
  }

  output_path = "${path.module}/test.zip"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "lambda" {
  statement {
    sid = "AllowWriteToCloudwatchLogs"

    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["arn:aws:logs:*:*:*"]
  }
}

resource "aws_iam_role" "lambda" {
  name_prefix        = "lambda-${random_pet.this.id}-"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy" "lambda" {
  name_prefix = "lambda-policy-"
  role        = aws_iam_role.lambda.id

  policy = data.aws_iam_policy_document.lambda.json
}

resource "aws_lambda_function" "this" {
  filename         = data.archive_file.lambda.output_path
  function_name    = "index_${random_pet.this.id}"
  role             = aws_iam_role.lambda.arn
  handler          = "index.lambda_handler"
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime          = "python3.6"
}
