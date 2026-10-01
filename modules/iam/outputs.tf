output "my_memo_lam_role_arn" {
    value = aws_iam_role.my_memo_lam.arn
}

output "delete_dynamo_role_arn" {
    value = aws_iam_role.delete_dynamo.arn
}