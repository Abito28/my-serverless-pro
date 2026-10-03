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

resource "aws_lambda_function" "delete_memo" {
  function_name = "delete-memo-Lam"                   
  role          = var.delete_role_arn      
  runtime       = "python3.14"                           
  handler       = "lambda_function.lambda_handler"       
  filename      = "dummy.zip"  

  lifecycle {
    ignore_changes = [filename, publish]
    }
}

resource "aws_lambda_function" "create_memo" {
  function_name = "create-memo-Lam"                   
  role          = var.create_role_arn      
  runtime       = "python3.14"                           
  handler       = "lambda_function.lambda_handler"       
  filename      = "dummy.zip"  

  lifecycle {
    ignore_changes = [filename, publish]
    }
}

resource "aws_lambda_function" "update_memo" {
  function_name = "update-memo-Lam"                   
  role          = var.update_role_arn      
  runtime       = "python3.14"                           
  handler       = "lambda_function.lambda_handler"       
  filename      = "dummy.zip"  

  lifecycle {
    ignore_changes = [filename, publish]
    }
}