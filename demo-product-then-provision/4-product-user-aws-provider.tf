provider "aws" {
  alias          = "product-demo-user"
  assume_role {
    role_arn          = aws_iam_role.tfprov-demo-user.arn
    session_name      = "tfm-sc-demo"
  }
}

