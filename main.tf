module "iam" {
  source = "./modules/iam"
}

module "lambda" {
  source = "./modules/lambda"
  role_arn = module.iam.my_memo_lam_role_arn
}