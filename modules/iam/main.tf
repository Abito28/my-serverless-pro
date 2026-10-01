data "aws_caller_identity" "current" {}

resource "aws_iam_role" "get_dynamo" {
    name = "get-dynamo"
    description = "Allows Lambda functions to call AWS services on your behalf."

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
      {
        Effect    = "Allow"
        Principal = { Service = "lambda.amazonaws.com" }
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "dynamo_write_for_lam" {
  name = "dynamo-write-for-Lam"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "VisualEditor0"
        Effect   = "Allow"
        Action   = "dynamodb:PutItem"
        Resource = "arn:aws:dynamodb:*:${data.aws_caller_identity.current.account_id}:table/*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_basic" {
  role       = aws_iam_role.get_dynamo.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "dynamo_write" {
  role       = aws_iam_role.get_dynamo.name
  policy_arn = aws_iam_policy.dynamo_write_for_lam.arn
}


resource "aws_iam_role" "delete_dynamo" {
    name = "delete-dynamo"
    description = "Allows Lambda functions to call AWS services on your behalf."

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
      {
        Effect    = "Allow"
        Principal = { Service = "lambda.amazonaws.com" }
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "delete_dynamo" {
  name = "delete-dynamoPolicy"
  role = aws_iam_role.delete_dynamo.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "VisualEditor0"
        Effect   = "Allow"
        Action   = "dynamodb:DeleteItem"
        Resource = "arn:aws:dynamodb:*:${data.aws_caller_identity.current.account_id}:table/*"
      }
    ]
  })
}