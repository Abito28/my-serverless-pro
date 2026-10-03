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