module "iam" {
  source = "./modules/iam"
}

module "lambda" {
  source = "./modules/lambda"
  role_arn = module.iam.my_memo_lam_role_arn
  delete_role_arn = module.iam.delete_dynamo_role_arn
  create_role_arn = module.iam.create_dynamo_role_arn
  update_role_arn = module.iam.update_dynamo_role_arn
}

module "api" {
  source              = "./modules/api"
  get_memo_lambda_arn = module.lambda.get_memo_arn
  create_memo_lambda_arn = module.lambda.create_memo_arn
  update_memo_lambda_arn = module.lambda.update_memo_arn
  delete_memo_lambda_arn = module.lambda.delete_memo_arn
}