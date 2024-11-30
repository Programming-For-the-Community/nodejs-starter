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
  timeout       = 30
  memory_size   = 128

  # VPC configuration
  vpc_config {
    subnet_ids         = [aws_subnet.nodejs_starter_east2a.id]
    security_group_ids = [aws_security_group.nodejs_starter_frontend_ecs_sg.id]
  }

  filename         = data.archive_file.get_team_lambda_zip.output_path
  source_code_hash = data.archive_file.get_team_lambda_zip.output_base64sha256

}

resource "aws_lambda_permission" "get_team_allow_lb_invoke" {
  statement_id  = "AllowALBInvokeGetTeam"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.get_team_lambda.arn
  principal     = "elasticloadbalancing.amazonaws.com"
  source_arn    = aws_lb_target_group.lambda_get_team_tg.arn
}