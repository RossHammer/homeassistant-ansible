provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "rosshammer"
    key    = "homeassistant.tfstate"
    region = "us-east-1"
  }
}

resource "aws_iam_access_key" "homeassistant" {
  user = "${aws_iam_user.homeassistant.name}"
}

resource "aws_iam_user" "homeassistant" {
  name = "homeassistant"
}

resource "aws_iam_user_policy" "homeassistant_policy" {
  name = "routes"
  user = "${aws_iam_user.homeassistant.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "route53:ChangeResourceRecordSets",
        "route53:ListResourceRecordSets"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

output "access_key_id" {
  value = "${aws_iam_access_key.homeassistant.id}"
}

output "secret_access_key" {
  value     = "${aws_iam_access_key.homeassistant.secret}"
  sensitive = true
}
