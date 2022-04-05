data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_cloudwatch_log_group" "greeter" {
  name              = "/aws/lambda/${local.lambda_name_greeter}"
  retention_in_days = 14

  tags = {
    CentralisedLogging = "enabled"
  }
}

data "aws_iam_policy_document" "greeter" {
  statement {
    actions = [
      "logs:CreateLogStream",
    ]

    resources = [
      "arn:aws:logs:*:*:*",
    ]
  }

  statement {
    actions = [
      "logs:PutLogEvents",
    ]

    resources = [
      "${aws_cloudwatch_log_group.greeter.arn}:*",
    ]
  }
}

resource "aws_iam_role" "greeter" {
  name               = local.lambda_name_greeter
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
}

resource "aws_iam_policy" "greeter" {
  name   = local.lambda_name_greeter
  path   = "/"
  policy = data.aws_iam_policy_document.greeter.json
}

resource "aws_iam_role_policy_attachment" "greeter" {
  role       = aws_iam_role.greeter.name
  policy_arn = aws_iam_policy.greeter.arn
}

resource "aws_lambda_function" "greeter" {
  function_name = local.lambda_name_greeter
  handler       = "packages/lambda-greeter/dist/index.handler"
  runtime       = "nodejs14.x"
  memory_size   = 256
  timeout       = 10
  s3_bucket     = local.code_s3_bucket
  s3_key        = "${var.repo}/lambda-greeter-${var.commit}.zip"
  role          = aws_iam_role.greeter.arn

  environment {
    variables = {
      ATTENDEE_NAME   = local.attendee_name
      NODE_ENV        = "production"
      MY_SECRET_TOKEN = var.my_secret_token
    }
  }
}

