resource "aws_lambda_function" "get_memo" {
  function_name = "my_memo_Lam"                   
  role          = var.role_arn      
  runtime       = "python3.14"                           
  handler       = "lambda_function.lambda_handler"       
  filename      = "dummy.zip"  

  lifecycle {
    ignore_changes = [filename, publish]
    }
}