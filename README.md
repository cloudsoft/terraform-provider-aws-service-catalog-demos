
# Demos of AWS Service Catalog support in Terraform

The `demo-*` sub-dir(s) contain examples of using the Service Catalog resources from Terraform.
See the README.md in the relevant sub-dir.


# Status

We are currently awaiting these PRs to be merged into the official `terraform-provider-aws` library:

* https://github.com/terraform-providers/terraform-provider-aws/pull/13797 - provisioned product and dependencies (in various linked PRs)
* https://github.com/terraform-providers/terraform-provider-aws/pull/14281 - constraints

These PRs provide the following resources:

* `aws_servicecatalog_portfolio` (enhancements to existing)
* `aws_servicecatalog_portfolio_principal_association` (new)
* `aws_servicecatalog_portfolio_product_association` (new)
* `aws_servicecatalog_product` (new)
* `aws_servicecatalog_provisioned_product` (new)
* `aws_servicecatalog_constraint` (new, supports any constraint but not as easy to use as the others)
* `aws_servicecatalog_launch_notification_constraint` (new)
* `aws_servicecatalog_launch_role_constraint` (new)
* `aws_servicecatalog_launch_template_constraint` (new)

Please **vote** for these PRs to help them get merged:  click the "thumbs up" icon underneath the PR description at the PR links above.


# To Use These Resources Now

If you'd like to use these resources while Hashicorp prioritize and review the PRs,
it's not hard -- you can grab a pre-built binary or you can build it yourself.

First either:

* Find and download the file for your OS in the `bin/` directory here, or
* Get the branch containing all the above from https://github.com/cloudsoft/terraform-provider-aws/tree/f-servicecatalog-launch-template-constraint and do a `go build` in the root

Then:

* Copy the resulting `terraform-provider-aws` binary file into `~/.terraform.d/plugins/`

That's it. Your `terraform` should now be able to use the new Service Catalog resources.
You can check it's installed correctly by looking for the following messages when running `terraform version`:

```
% terraform version
...
2020/07/21 23:21:22 [DEBUG] checking for provider in "/Users/alex/.terraform.d/plugins"
2020/07/21 23:21:22 [WARN] found legacy provider "terraform-provider-aws"
2020/07/21 23:21:22 [DEBUG] found valid plugin: "aws", "0.0.0", "/Users/alex/.terraform.d/plugins/terraform-provider-aws"
...
```


# Remaining Work

The following Service Catalog resources remain to be implemented:

* AWS::ServiceCatalog::ResourceUpdateConstraint
* AWS::ServiceCatalog::TagOption
* AWS::ServiceCatalog::TagOptionAssociation
* AWS::ServiceCatalog::AcceptedPortfolioShare
* AWS::ServiceCatalog::PortfolioShare
* AWS::ServiceCatalog::StackSetConstraint

