data "archive_file" "get_team_lambda_zip" {
  type        = "zip"
  source_dir  = "../Source/AWSLambdas/GetTeam"
  output_path = "../Source/AWSLambdas/GetTeam/get-team-lambda.zip"
}

resource "aws_lambda_function" "get_team_lambda" {
  function_name = "get-team-lambda"
  runtime       = "nodejs18.x"
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.handler"

  filename         = data.archive_file.get_team_lambda_zip.output_path
  source_code_hash = data.archive_file.get_team_lambda_zip.output_base64sha256

  timeout     = 10
  memory_size = 128
}

resource "aws_lambda_permission" "get_team_allow_lb_invoke" {
  statement_id  = "AllowALBInvokeGetTeam"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.get_team_lambda.arn
  principal     = "elasticloadbalancing.amazonaws.com"
  source_arn    = aws_lb_target_group.lambda_get_team_tg.arn
}