resource "aws_db_instance" "this" {
  identifier            = var.name
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  storage_type          = var.storage_type
  engine                = var.engine
  engine_version        = var.engine_version
  instance_class        = var.instance_class
  db_name               = var.db_name
  username              = var.username
  password              = var.password
  port                  = var.port
  skip_final_snapshot   = var.skip_final_snapshot
  publicly_accessible   = var.publicly_accessible
  tags                  = var.tags
}
