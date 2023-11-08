resource "aws_iam_user" "user" {
  name = "${var.prefix}-user-${random_string.random.id}"
  force_destroy = true
  tags = {
    Name = "${var.prefix}-user-${random_string.random.id}"
    Environment = "${var.environment}"
    CostCenter = "${var.cost-center}"
  }
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "${var.prefix}-user-policy-attachment-${random_string.random.id}"
  users      = [aws_iam_user.user.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}