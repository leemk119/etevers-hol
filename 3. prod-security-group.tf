# ## Public용 Security Group 생성 ##
# resource "aws_security_group" "Co-PRD-PUB-SG" {
#   name        = "Co-PRD-PUB-SG"
#   description = "Security Group for ALB"
#   vpc_id      = aws_vpc.Co-AN2-PRD-VPC.id

#   ## egress rules 정의
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = -1
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ## ingress rules 정의
#   ingress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = -1
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "co-prd-pub-sg"
#   }
# }

# ## WEB용 Security Group 생성 ##
# resource "aws_security_group" "Co-PRD-PRI-WEB-SG" {
#   name        = "Co-PRD-PRI-WEB-SG"
#   description = "Security Group for WEB"
#   vpc_id      = aws_vpc.Co-AN2-PRD-VPC.id

#   ## egress rules 정의
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = -1
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ## ingress rules 정의
#   ingress {
#     from_port = 80
#     to_port   = 80
#     protocol  = "tcp"
#     # cidr_blocks = ["0.0.0.0/0"] # 외부 접근 허용
#     security_groups = [aws_security_group.Co-PRD-PUB-SG.id] // ALB의 보안 그룹으로부터의 트래픽만 허용
#   }

#   ## ingress rules 정의
#   ingress {
#     from_port = 443
#     to_port   = 443
#     protocol  = "tcp"
#     # cidr_blocks = ["0.0.0.0/0"] # 외부 접근 허용
#     security_groups = [aws_security_group.Co-PRD-PUB-SG.id] // ALB의 보안 그룹으로부터의 트래픽만 허용
#   }

#   tags = {
#     Name = "co-prd-pri-web-sg"
#   }
# }

# ##### HoL에서는 WAS 관련 리소스는 사용 안함 #####
# # ## WAS용 Security Group ##
# # resource "aws_security_group" "Co-PRD-PRI-WAS-SG" {
# #   name        = "Co-PRD-PRI-WAS-SG"
# #   description = "Security Group for WAS"
# #   vpc_id      = aws_vpc.Co-AN2-PRD-VPC.id

# #   ## egress rules 정의
# #   egress {
# #     from_port   = 0
# #     to_port     = 0
# #     protocol    = -1
# #     cidr_blocks = ["0.0.0.0/0"]
# #   }

# #   ## ingress rules 정의
# #   ingress {
# #     from_port   = 0 // 특정 포트 사용
# #     to_port     = 0 // 특정 포트 사용
# #     protocol    = -1
# #     cidr_blocks = ["0.0.0.0/0"]
# #   }

# #   tags = {
# #     Name = "co-prd-pri-was-sg"
# #   }
# # }

# ## DB용 Security Group 생성 ##
# resource "aws_security_group" "Co-PRD-PRI-DB-SG" {
#   name        = "Co-PRD-PRI-DB-SG"
#   description = "Security Group for DB"
#   vpc_id      = aws_vpc.Co-AN2-PRD-VPC.id

#   ## egress rules 정의
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = -1
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ## ingress rules 정의 / 3306 tpc 허용
#   ingress {
#     from_port   = 3306
#     to_port     = 3306
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "co-prd-pri-db-sg"
#   }
# }