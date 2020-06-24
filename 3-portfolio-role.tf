resource "aws_iam_role" "tfprov-demo-user" {
  name = "tfprov-demo-user"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": { "AWS": "*" },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_servicecatalog_portfolio_principal_association" "association" {
    portfolio_id = aws_servicecatalog_portfolio.demo.id
    principal_arn = aws_iam_role.tfprov-demo-user.arn
}

resource "aws_iam_role_policy" "tfprov-demo-user-access-policy" {
  name = "test_policy"
  role = aws_iam_role.tfprov-demo-user.id

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "servicecatalog:*",
          "cloudformation:*",
          "s3:*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  }
  EOF
}
