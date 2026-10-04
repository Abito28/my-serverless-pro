resource "aws_lambda_permission" "get_memo_item" {
  statement_id  = "f331796e-f1c8-5646-a219-779c67d22d89"
  action        = "lambda:InvokeFunction"
  function_name = "my_memo_Lam"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.memo.execution_arn}/*/*/memos/{memo_id}"
}

resource "aws_lambda_permission" "get_memo_list" {
  statement_id  = "5239bb86-4b0d-500f-a215-15dc629eabc4"
  action        = "lambda:InvokeFunction"
  function_name = "my_memo_Lam"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.memo.execution_arn}/*/*/memos"
}

resource "aws_lambda_permission" "create_memo" {
  statement_id  = "4eaa9f55-9f6a-5550-a10d-4d79701d89a6"
  action        = "lambda:InvokeFunction"
  function_name = "create-memo-Lam"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.memo.execution_arn}/*/*/memos"
}

resource "aws_lambda_permission" "update_memo" {
  statement_id  = "4c97ece6-1896-562b-9314-ba925dd06f42"
  action        = "lambda:InvokeFunction"
  function_name = "update-memo-Lam"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.memo.execution_arn}/*/*/memos/{memo_id}"
}

resource "aws_lambda_permission" "delete_memo" {
  statement_id  = "85b2ec0e-4bb7-52f2-841f-1bd02cfe0b12"
  action        = "lambda:InvokeFunction"
  function_name = "delete-memo-Lam"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.memo.execution_arn}/*/*/memos/{memo_id}"
}