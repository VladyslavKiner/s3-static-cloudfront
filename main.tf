module "s3_bucket" {
  source = "git@github.com:cloudposse/terraform-aws-s3-bucket.git"
  name                     = var.name

  s3_object_ownership      = "BucketOwnerEnforced"
  enabled                  = true
  user_enabled             = false
  versioning_enabled       = false

  privileged_principal_actions   = ["s3:GetObject", "s3:ListBucket", "s3:GetBucketLocation"]
  privileged_principal_arns      = [
    {
      (local.deployment_iam_role_arn) = [""]
    },
    {
      (local.additional_deployment_iam_role_arn) = ["prefix1/", "prefix2/"]
    }
  ]
}