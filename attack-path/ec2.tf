data "aws_ami" "ec2_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20231018.2-*"]
  }
}

resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.ec2_ami.id
  instance_type = "t3.micro"
  security_groups = [aws_security_group.v1-attack-path-ec2-sg.name]
  iam_instance_profile = aws_iam_instance_profile.v1-attack-path-rds-instance-profile.name

  tags = {
    Name = "${var.prefix}-ec2-${random_string.random.id}"
    Environment = var.environment
    CostCenter = var.cost-center
  }
}