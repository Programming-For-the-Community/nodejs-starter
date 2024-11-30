data "archive_file" "get_team_lambda_zip" {
  type        = "zip"
  source_dir  = "../Source/AWSLambdas/GetTeam"
  output_path = "../Source/AWSLambdas/GetTeam/get-team-lambda.zip"
}

resource "aws_lambda_function" "nodejs_lambda" {
  function_name = "get-team-lambda"
  runtime       = "nodejs18.x"
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.handler"

  filename         = data.archive_file.get_team_lambda_zip.output_path
  source_code_hash = data.archive_file.get_team_lambda_zip.output_base64sha256

  timeout     = 10
  memory_size = 128
}