resource "aws_db_instance" "db" {
  identifier = "${var.common.env}-${var.common.project}-${var.rds_name}"
  allocated_storage = var.allocated_storage
  engine = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  username = var.username
  password = var.password
  db_name = var.db_name
  port = var.port
  parameter_group_name = aws_db_parameter_group.db_parameter_group.name
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.sg_db.id]
  skip_final_snapshot  = true // dont create snapshot before deleted
  backup_retention_period = "7"
  backup_window = "00:30-01:30"
  maintenance_window = "sat:04:30-sat:05:30"
}

resource "aws_security_group" "sg_db" {
    name = "${var.common.env}-${var.common.project}-${var.rds_name}-sg"
    vpc_id = var.rds_network.vpc_id

    ingress {
      from_port   = 0
      to_port     = 0
      protocol    = "TCP"
      security_group = var.rds_sg // allow to access rds via sg
      security_group_id = aws_security_group.sg_db.id // allow to access rds via (response)
    }

    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_parameter_group" "db_parameter_group" {
    name = "${var.common.env}-${var.common.project}-${var.rds_name}"
    family = var.rds_family
}

resource "aws_db_subnet_group" "db_subnet_group" {
    name = "${var.common.env}-${var.common.project}-${var.rds_name}"
    subnet_ids = var.rds_network.subnet_ids
}