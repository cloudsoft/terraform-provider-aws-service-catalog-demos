data "aws_region" "current" { }

resource "aws_s3_bucket" "bucket" {
  bucket        = "bucket-tfprov-demo-123"
  region        = data.aws_region.current.name
  acl           = "private"
  force_destroy = true
}

resource "aws_s3_bucket_object" "tfprov-demo-template" {
  bucket  = aws_s3_bucket.bucket.id
  key     = "demo-tf-prov.json"
  content = <<EOF

{
  "AWSTemplateFormatVersion": "2010-09-09",
  "Description": "Very dull sample product for demo",
  "Resources": {
    "Empty": {
      "Type": "AWS::CloudFormation::WaitConditionHandle"
    }
  }
}

EOF
}

resource "aws_servicecatalog_product" "demo" {
  name                = "product-tfprov-demo-123"
  product_type        = "CLOUD_FORMATION_TEMPLATE"

  owner               = "Cloudsoft"
  support_email       = "info@cloudsoft.io"
  support_url         = "http://cloudsoft.io"

  provisioning_artifact {
    description = "v1"
    name        = "pa-tfprov-demo-123"
    info = {
      LoadTemplateFromURL = "https://s3.amazonaws.com/${aws_s3_bucket.bucket.id}/${aws_s3_bucket_object.tfprov-demo-template.key}"
    }
  }
}

resource "aws_servicecatalog_portfolio_product_association" "association" {
    portfolio_id = aws_servicecatalog_portfolio.demo.id
    product_id = aws_servicecatalog_product.demo.id
}

