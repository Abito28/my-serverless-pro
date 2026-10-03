output "get_memo_arn" {
  value = aws_lambda_function.get_memo.arn
}

output "delete_memo_arn" {
  value = aws_lambda_function.delete_memo.arn
}

output "create_memo_arn" {
  value = aws_lambda_function.create_memo.arn
}

output "update_memo_arn" {
  value = aws_lambda_function.update_memo.arn
}