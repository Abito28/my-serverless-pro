# my-serverless-pro
This is my serverless project. I am mainly using Lambda,DynamoDB,API Gataway on this project to understand how the main serverless services works and the function of using terraform import. I already bilut a memo management toll and here I am tring to import what I did using Terraform.

## Overall
First, I built a really simple memo management tool using Api gataway, Lambda and Dynamodb. For the db and Lambda I used a IAM role and policy that allows each lambda to work seperatally. Then I imported it in terraform for the first time. I used to make a resource from scratch but this time I wanted to know how to use import.

## Composition
API Gateway(HTTP API) → Lambda(4 types) → DynamoDB(name:memos)
- GET /memos/{memo_id} / POST /memos / PUT /memos/{memo_id} / DELETE /memos/{memo_id}
Each IAM roles for Lambda

## Directory
modules/iam, modules/lambda, modules/api, modules/db

## Resources used
4 roles and policies, 4 lambda, API Gataway, Lambda permission and DynamoDB table.

## Things I cared
- Before using import, I checked the status in the console and CLI to match the code.
- I am not managing the code inside Lambda in this case python.
- I did not put the AccountID and ARN inside terraform. Insted I used `data` and `variable`
- The `.tfstate` file and other files that should not have accesses for outside, I used the `gitignore`

## What I learned
I learned the basics of using import and the lambda. Lambda and API Gataway have their resource name which describes theris ID in the console and the path like `route_key` to know what exactlly it works.
Before I code the resource in the terraform I have to figure out these ID using AWS CLI or directly in the console.
The scope is intentionally small: the goal was to learn the import workflow, not to build a complex application.

## 今後の予定
Now I learned the basics of Terraform so I will go for my next step which is CI/CD. To become a AWS cloud engineer, the understanding of CI/CD is essential.
