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