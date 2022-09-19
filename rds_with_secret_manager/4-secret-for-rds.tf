resource "random_password" "master_password" {
  length  = 16
  special = false
}


resource "aws_db_instance" "default" {
  identifier             = "mi-base-dato-test"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "13.3"
  username             = "newuser"
  password             = random_password.master_password.result
  parameter_group_name   = aws_db_parameter_group.education.name
  skip_final_snapshot  = true
  publicly_accessible = true
}

resource "aws_db_parameter_group" "education" {
  name   = "education-2"
  family = "postgres13"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}
resource "aws_secretsmanager_secret" "newrds" {
  kms_key_id   ="arn:aws:kms:us-east-1:231213123:key/cbces96c0-d496-4265-9ddb7-08db0a113109"
  name          = "credential2-mi-base-dato-test"
  description = "credential bd"
}

resource "aws_secretsmanager_secret_version" "rds_credentials" {
  secret_id     = aws_secretsmanager_secret.newrds.id
  secret_string = <<EOF
{
  "Username": "${aws_db_instance.default.username}",
  "Password": "${random_password.master_password.result}",
  "Engine": "${aws_db_instance.default.engine}",
  "Host": "${aws_db_instance.default.endpoint}",
  "Port": ${aws_db_instance.default.port}
}
EOF
}




