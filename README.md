
# Illustration of AWS Service Catalog Resources using Terraform

Setup:

* `export AWS_DEFAULT_REGION="eu-central-1"`
* `terraform init`

Run:

* `./stage.sh 3`
* `terraform apply`
* `./stage.sh 5`
* `terraform apply`

This should result in a provisioned product, built up from scratch.

You can also pass through each individual stage.
The individual files `*.tf*` show the different resources needed,
from the portfolio and the product (definition), to the associations,
roles and policies, and finally the provisioned product (instance).

Note you cannot skip stage 3 on creation, and if backtracking
from stage 5 you must pass through stage 4 (or destroy). 
This is because provisioning in stage 5 requires 
a provider created in stage 4 that uses a role created in stage 3. 
(It is a limitation of Terraform that "provider" instances 
cannot use dynamically created values, such as the role
that needs to be assumed. You could edit the association to use a 
pre-existing principal that your user has, here, if that's a problem.
In the real world, of course, it will typically be different environments 
that define the roles, the portfolios and products, and the product 
instances, so this isn't a real-world problem for us.)

