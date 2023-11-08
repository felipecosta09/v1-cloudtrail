resource "aws_db_instance" "v1-attack-path-rds" {
  allocated_storage    = 20
  max_allocated_storage = 100
  storage_type        = "gp3"
  engine              = "mysql"
  engine_version      = "5.7"
  identifier          = "${var.prefix}-rds-${random_string.random.id}"
  instance_class      = "db.t2.micro"
  username            = "admin"
  password            = "${random_string.random.id}"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot = true
  db_name = "rds${random_string.random.id}"
  vpc_security_group_ids = [aws_security_group.v1-attack-path-rds-sg.id]
  tags = {
    Name = "${var.prefix}-rds-${random_string.random.id}"
    Environment = var.environment
    CostCenter = var.cost-center
  }
}
