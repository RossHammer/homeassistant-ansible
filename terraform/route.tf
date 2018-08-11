resource "aws_iam_access_key" "route" {
  user = "${aws_iam_user.route.name}"
}

resource "aws_iam_user" "route" {
  name = "route"
}

resource "aws_iam_user_policy" "route_policy" {
  name = "routes"
  user = "${aws_iam_user.route.name}"

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

output "route_access_key_id" {
  value = "${aws_iam_access_key.route.id}"
}

output "route_secret_access_key" {
  value     = "${aws_iam_access_key.route.secret}"
  sensitive = true
}
