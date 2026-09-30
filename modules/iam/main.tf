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