resource "aws_iam_user" "user" {
  name = "${var.prefix}-user-${random_string.random.id}"
  force_destroy = true
  tags = {
    Name = "${var.prefix}-user-${random_string.random.id}"
    Environment = "${var.environment}"
    CostCenter = "${var.cost-center}"
  }
}

resource "aws_iam_policy" "user-policy" {
  name        = "${var.prefix}-user-policy-${random_string.random.id}"
  description = "Policy to allow access to RDS"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "${var.prefix}-user-policy-attachment-${random_string.random.id}"
  users      = [aws_iam_user.user.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}