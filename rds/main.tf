provider "aws" {
  region =""
  
}

resource "aws_db_instance" "this" {
  allocated_storage      = "${var.allocated_storage}"
  storage_type           = "${var.storage_type}"
  engine                 = "${var.engine}"
  engine_version         = "${var.engine_version}"
  instance_class         = "${var.instance_class}"
  identifier             = "${var.owner}-${var.env}-${var.project}"
  username               = "${var.username}"
  password               = "${var.password}"
  db_subnet_group_name   = "${var.db_subnet_group_name}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  skip_final_snapshot    = "${var.skip_final_snapshot}"

  tags = {
    Name    = "${var.name_rds}"
    Env     = "${var.env}"
  }
  timeouts {
    create = "${var.timeouts}"
    update = "${var.timeouts}"
    delete = "${var.timeouts}"
  }
}