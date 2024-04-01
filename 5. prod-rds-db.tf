# ## RDS DB Instance 생성 ##
# resource "aws_db_instance" "Co-AN2-PRD-MAIN-DB-RDS" {
#   identifier                = "co-an2-prd-main-db-rds"
#   storage_type              = "gp3"
#   allocated_storage         = 50
#   engine                    = "mysql"
#   instance_class            = "db.t3.medium"
#   username                  = "root"
#   password                  = "Password1"
#   vpc_security_group_ids    = [aws_security_group.Co-PRD-PRI-DB-SG.id]
#   port                      = 3306
#   multi_az                  = true // false
#   db_subnet_group_name      = aws_db_subnet_group.Co-AN2-PRD-DB-SUBNET-GRP.name
#   parameter_group_name      = null
#   skip_final_snapshot       = true // false (종료시 생성 비활성화)
#   # final_snapshot_identifier = "prod-rds-snap"
#   backup_retention_period   = 0 // 자동 백업 보존 0
# }

# ## DB SubnetGroup 생성 ##
# resource "aws_db_subnet_group" "Co-AN2-PRD-DB-SUBNET-GRP" {
#   name       = "co-an2-prd-db-sbn-grp"
#   subnet_ids = [aws_subnet.Co-AN2-AZa-PRD-SBN-PRI-DB.id, aws_subnet.Co-AN2-AZc-PRD-SBN-PRI-DB.id]
#   tags = {
#     Name = "co-an2-Prd-db-sbn-grp"
#   }
# }
