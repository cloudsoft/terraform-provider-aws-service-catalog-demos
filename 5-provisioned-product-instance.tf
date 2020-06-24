resource "aws_servicecatalog_provisioned_product" "demo" {

    provider                 = aws.product-demo-user

    provisioned_product_name = "tfprov-demo-product-provisioned-instance"

    product_id               = aws_servicecatalog_product.demo.id
    provisioning_artifact_id = aws_servicecatalog_product.demo.provisioning_artifact[0].id

    depends_on = [
      aws_iam_role_policy.tfprov-demo-user-access-policy,
      aws_servicecatalog_portfolio_product_association.association,
      aws_servicecatalog_portfolio_principal_association.association,
    ]
}
