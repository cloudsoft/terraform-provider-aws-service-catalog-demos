
resource "aws_servicecatalog_portfolio" "demo" {
  name          = "tfprov-demo-123"
  description   = "Porfolio demonstrating how to use the Service Catalog resource in the Terraform AWS Provider"
  provider_name = "Cloudsoft"
}
