resource "aws_iam_access_key" "game_servers_bot" {
  user = "${aws_iam_user.game_servers_bot.name}"
}

resource "aws_iam_user" "game_servers_bot" {
  name = "game_servers_bot"
}

resource "aws_iam_user_policy" "game_servers_bot_policy" {
  name = "routes"
  user = "${aws_iam_user.game_servers_bot.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*",
        "ec2:RequestSpotFleet"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

output "bot_access_key_id" {
  value = "${aws_iam_access_key.game_servers_bot.id}"
}

output "bot_secret_access_key" {
  value     = "${aws_iam_access_key.game_servers_bot.secret}"
  sensitive = true
}
