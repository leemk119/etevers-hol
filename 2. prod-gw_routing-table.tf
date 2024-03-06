# ## 인터넷 게이트웨이 생성 ##
# resource "aws_internet_gateway" "Co-AN2-PRD-IGW" {
#   vpc_id = aws_vpc.Co-AN2-PRD-VPC.id

#   tags = {
#     Name = "co-an2-prd-igw"
#   }
# }

# ## NAT 게이트웨이 & EIP 생성 ##
# resource "aws_eip" "Co-AN2-AZa-PRD-NGW-eip" {
#   domain = "vpc"

#   tags = {
#     Name = "co-an2-aza-prd-ngw-eip"
#   }
# }

# resource "aws_nat_gateway" "Co-AN2-AZa-PRD-NGW" {
#   allocation_id = aws_eip.Co-AN2-AZa-PRD-NGW-eip.id
#   subnet_id     = aws_subnet.Co-AN2-AZa-PRD-SBN-PUB.id

#   tags = {
#     Name = "co-an2-aza-prd-ngw"
#   }
# }


# ## 퍼블릭 서브넷 1A & 1C 라우팅 연결 -> 인터넷 게이트웨이 ##
# resource "aws_route_table" "Co-AN2-PRD-PUB-RT" {
#   vpc_id = aws_vpc.Co-AN2-PRD-VPC.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.Co-AN2-PRD-IGW.id
#   }

#   tags = {
#     Name = "co-an2-prd-pub-rt"
#   }
# }

# ## 프라이빗 WEB 서브넷 1A & 1C 라우팅 연결 -> NAT 게이트웨이 ##
# resource "aws_route_table" "Co-AN2-PRD-PRI-WEB-RT" {
#   vpc_id = aws_vpc.Co-AN2-PRD-VPC.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.Co-AN2-AZa-PRD-NGW.id
#   }

#   tags = {
#     Name = "co-an2-prd-pri-web-rt"
#   }
# }

# ##### HoL에서는 WAS 관련 리소스는 사용 안함 #####
# # ## 프라이빗 WAS 서브넷 1A & 1C 라우팅 연결 -> NAT 게이트웨이 ## 
# # resource "aws_route_table" "Co-AN2-PRD-PRI-WAS-RT" {
# #   vpc_id = aws_vpc.Co-AN2-PRD-VPC.id

# #   route {
# #     cidr_block = "0.0.0.0/0"
# #     gateway_id = aws_nat_gateway.Co-AN2-AZa-PRD-NGW.id
# #   }

# #   tags = {
# #     Name = "co-an2-prd-pri-was-rt"
# #   }
# # }

# ## 프라이빗 DB 서브넷 1A & 1C 라우팅 연결 -> NAT 게이트웨이 ## 
# resource "aws_route_table" "Co-AN2-PRD-PRI-DB-RT" {
#   vpc_id = aws_vpc.Co-AN2-PRD-VPC.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.Co-AN2-AZa-PRD-NGW.id
#   }

#   tags = {
#     Name = "co-an2-prd-pri-db-rt"
#   }
# }

# ## 퍼블릭 서브넷 1A 라우팅 테이블 연결 ##
# resource "aws_route_table_association" "Co-AN2-PRD-PUB-RT_association1" {
#   subnet_id      = aws_subnet.Co-AN2-AZa-PRD-SBN-PUB.id
#   route_table_id = aws_route_table.Co-AN2-PRD-PUB-RT.id
# }

# ## 퍼블릭 서브넷 1C 라우팅 테이블 연결 ##
# resource "aws_route_table_association" "Co-AN2-PRD-PUB-RT_association2" {
#   subnet_id      = aws_subnet.Co-AN2-AZc-PRD-SBN-PUB.id
#   route_table_id = aws_route_table.Co-AN2-PRD-PUB-RT.id
# }

# ## 프라이빗 WEB 서브넷 1A 라우팅 테이블 연결 ##
# resource "aws_route_table_association" "Co-AN2-PRD-PRI-WEB-RT_association1" {
#   subnet_id      = aws_subnet.Co-AN2-AZa-PRD-SBN-PRI-WEB.id
#   route_table_id = aws_route_table.Co-AN2-PRD-PRI-WEB-RT.id
# }

# ## 프라이빗 WEB 서브넷 1C 라우팅 테이블 연결 ##
# resource "aws_route_table_association" "Co-AN2-PRD-PRI-WEB-RT_association2" {
#   subnet_id      = aws_subnet.Co-AN2-AZc-PRD-SBN-PRI-WEB.id
#   route_table_id = aws_route_table.Co-AN2-PRD-PRI-WEB-RT.id
# }

# ##### HoL에서는 WAS 관련 리소스는 사용 안함 #####
# # ## 프라이빗 WAS 서브넷 1A 라우팅 테이블 연결 ##
# # resource "aws_route_table_association" "Company-AN2-PRD-PRI-WAS-RT_association1" {
# #   subnet_id      = aws_subnet.Co-AN2-AZa-PRD-SBN-PRI-WAS.id
# #   route_table_id = aws_route_table.Co-AN2-PRD-PRI-WAS-RT.id
# # }

# # ## 프라이빗 WAS 서브넷 1C 라우팅 테이블 연결 ##
# # resource "aws_route_table_association" "Co-AN2-PRD-PRI-WAS-RT_association2" {
# #   subnet_id      = aws_subnet.Co-AN2-AZc-PRD-SBN-PRI-WAS.id
# #   route_table_id = aws_route_table.Co-AN2-PRD-PRI-WAS-RT.id
# # }

# ## 프라이빗 DB 서브넷 1A 라우팅 테이블 연결 ##
# resource "aws_route_table_association" "Co-AN2-PRD-PRI-DB-RT_association1" {
#   subnet_id      = aws_subnet.Co-AN2-AZa-PRD-SBN-PRI-DB.id
#   route_table_id = aws_route_table.Co-AN2-PRD-PRI-DB-RT.id
# }

# ## 프라이빗 DB 서브넷 1C 라우팅 테이블 연결 ##
# resource "aws_route_table_association" "Co-AN2-PRD-PRI-DB-RT_association2" {
#   subnet_id      = aws_subnet.Co-AN2-AZc-PRD-SBN-PRI-DB.id
#   route_table_id = aws_route_table.Co-AN2-PRD-PRI-DB-RT.id
# }