resource "aws_lambda_function" "hello" {
  depends_on       = [aws_iam_role.lambda]
  filename         = "hello.zip"
  function_name    = "hello"
  role             = aws_iam_role.lambda.arn
  description      = "Notifies/ Actions for CIS"
  handler          = "hello.lambda_handler"
  runtime          = "python3.7"
  timeout          = 10
  memory_size      = 256
  source_code_hash = base64sha256("hello.zip")
  environment {
    variables = {
      REGION = "us-west-2"
    }
  }
  vpc_config {
    subnet_ids         = [aws_subnet.public-subnet2.id]
    security_group_ids = [aws_security_group.allow_tls.id]
  }
}