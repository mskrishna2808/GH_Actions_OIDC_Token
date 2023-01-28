resource "aws_iam_openid_connect_provider" "identity_provider" {
  url = "https://token.actions.githubusercontent.com"
  client_id_list = [
    "sts.amazonaws.com",
  ]
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
}

resource "aws_iam_role" "github_actions_role" {
  name        = "github-actions-role"
  description = "This role will be used for GitHub actions"
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
  ]
  assume_role_policy = "${file("trust_policy.json")}"
}