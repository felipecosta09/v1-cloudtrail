resource "aws_iam_role" "v1-attack-path-rds-access-role" {
  name = "v1-attack-path-ec2-role-${random_string.random.id}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    Name = "v1-attack-path-ec2-role-${random_string.random.id}"
  }
}

resource "aws_iam_policy" "v1-attack-path-rds-access-policy" {
  name        = "v1-attack-path-ec2-policy-${random_string.random.id}"
  description = "Policy for accessing RDS"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "rds-db:connect",
            "Resource": "arn:aws:rds:${var.aws_region}:${data.aws_caller_identity.current.account_id}:db:${aws_db_instance.v1-attack-path-rds.identifier}"
        }
    ]
}
EOF

  tags = {
    Name = "v1-attack-path-ec2-policy-${random_string.random.id}"
  }
}

resource "aws_iam_policy_attachment" "v1-attack-path-rds-attach-rds-policy" {
  name       = "v1-attack-path-rds-attach-rds-policy-${random_string.random.id}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
  roles      = [aws_iam_role.v1-attack-path-rds-access-role.name]
}

resource "aws_iam_instance_profile" "v1-attack-path-rds-instance-profile" {
  name = "v1-attack-path-rds-instance-profile"
  role = aws_iam_role.v1-attack-path-rds-access-role.name
}