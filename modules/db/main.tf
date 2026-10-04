resource "aws_dynamodb_table" "memos" {
  name         = "memos"
  billing_mode = "PAY_PER_REQUEST"  
  hash_key     = "memo_id"

  attribute {
    name = "memo_id"
    type = "S"                      
  }
}