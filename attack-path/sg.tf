resource "aws_security_group" "v1-attack-path-rds-sg" {
  name        = "${var.prefix}-rds-sg-${random_string.random.id}"
  description = "Security group for RDS instance"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Open to all, you may restrict it to specific IP ranges
  }
  tags = {
    Name = "${var.prefix}-rds-sg-${random_string.random.id}"
    Environment = var.environment
    CostCenter = var.cost-center
  }
}

resource "aws_security_group" "v1-attack-path-ec2-sg" {
  name        = "${var.prefix}-ec2-sg-${random_string.random.id}"
  description = "Security group for EC2 instance"

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.prefix}-ec2-sg-${random_string.random.id}"
    Environment = var.environment
    CostCenter = var.cost-center
  }
}