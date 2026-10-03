resource "aws_apigatewayv2_api" "memo" {
  name          = "my-memo-api"     # 実物の Name
  protocol_type = "HTTP"            # 実物の ProtocolType
}

resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.memo.id   # どのAPIのステージか
  name        = "$default"                      # 実物の StageName
  auto_deploy = true                            # 実物の AutoDeploy
}

resource "aws_apigatewayv2_integration" "get_memo" {
  api_id                 = aws_apigatewayv2_api.memo.id
  integration_type       = "AWS_PROXY"          # 実物の IntegrationType
  integration_method     = "POST"               # 実物の IntegrationMethod
  integration_uri        = var.get_memo_lambda_arn   # 接続先LambdaのARN(外から受け取る)
  payload_format_version = "2.0"                # 実物の PayloadFormatVersion
}

resource "aws_apigatewayv2_route" "get_memo" {
  api_id    = aws_apigatewayv2_api.memo.id
  route_key = "GET /memos/{memo_id}"            # 実物の RouteKey
  target    = "integrations/${aws_apigatewayv2_integration.get_memo.id}"
}

resource "aws_apigatewayv2_integration" "create_memo" {
  api_id                 = aws_apigatewayv2_api.memo.id
  integration_type       = "AWS_PROXY"
  integration_method     = "POST"
  integration_uri        = var.create_memo_lambda_arn   # create-memo-Lam のARN(外から受け取る)
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "create_memo" {
  api_id    = aws_apigatewayv2_api.memo.id
  route_key = "POST /memos"                              # 実物の RouteKey
  target    = "integrations/${aws_apigatewayv2_integration.create_memo.id}"   # 同じセットの create_memo を参照
}

resource "aws_apigatewayv2_integration" "update_memo" {
  api_id                 = aws_apigatewayv2_api.memo.id
  integration_type       = "AWS_PROXY"
  integration_method     = "POST"
  integration_uri        = var.update_memo_lambda_arn   # update-memo-Lam のARN(外から受け取る)
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "update_memo" {
  api_id    = aws_apigatewayv2_api.memo.id
  route_key = "PUT /memos/{memo_id}"                              # 実物の RouteKey
  target    = "integrations/${aws_apigatewayv2_integration.update_memo.id}"   # 同じセットの update_memo を参照
}

resource "aws_apigatewayv2_integration" "delete_memo" {
  api_id                 = aws_apigatewayv2_api.memo.id
  integration_type       = "AWS_PROXY"
  integration_method     = "POST"
  integration_uri        = var.delete_memo_lambda_arn   # delete-memo-Lam のARN(外から受け取る)
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "delete_memo" {
  api_id    = aws_apigatewayv2_api.memo.id
  route_key = "DELETE /memos/{memo_id}"                              # 実物の RouteKey
  target    = "integrations/${aws_apigatewayv2_integration.delete_memo.id}"   # 同じセットの delete_memo を参照
}