# ## WEB1 EC2 ENI 생성 ##
# resource "aws_network_interface" "Co-AN2-AZa-PRD-PRI-WEB-EC2-eni" {
#   subnet_id       = aws_subnet.Co-AN2-AZa-PRD-SBN-PRI-WEB.id
#   private_ips     = ["10.0.6.11"]
#   security_groups = [aws_security_group.Co-PRD-PRI-WEB-SG.id]

#   tags = {
#     Name = "Co-AN2-AZa-PRD-PRI-WEB-EC2-eni"
#   }
# }

# ## WEB1 EC2 생성 ##
# resource "aws_instance" "Co-AN2-AZa-PRD-PRI-WEB-EC2" {
#   ami           = "ami-0ff1cd0b5d98708d1" //Amazon 2023 AMI latest)
#   instance_type = "t3.small"              // 2vcpu,2G
#   key_name      = "MyKeyPair"             //**꼭 자신이 만든 키 Name 입력**
#   # user_data     = data.template_file.web_user_data.rendered //사용자 데이터 지정 (WEB 서버 구성)
#   user_data = <<-EOF
#   #!/bin/bash

#   # Apache 웹 서버 설치
#   sudo yum update -y
#   sudo yum install httpd -y

#   # Apache 서버 시작
#   sudo systemctl start httpd

#   # 부팅 시 자동 시작 설정
#   sudo systemctl enable httpd

#   echo "Hello, ETEVERS IaC HoL Server-1!" > /var/www/html/index.html
#   EOF

#   network_interface { // ENI 지정
#     network_interface_id = aws_network_interface.Co-AN2-AZa-PRD-PRI-WEB-EC2-eni.id
#     device_index         = 0
#   }

#   ## EBS 정의
#   root_block_device {
#     volume_size           = "30"
#     volume_type           = "gp3"
#     encrypted             = false
#     delete_on_termination = true //EC2 삭제시 함께 제거
#   }

#   tags = {
#     Name = "Co-AN2-AZa-PRD-PRI-WEB-EC2"
#   }
# }

# ## WEB2 EC2 ENI 생성 ##
# resource "aws_network_interface" "Co-AN2-AZc-PRD-PRI-WEB-EC2-eni" {
#   subnet_id       = aws_subnet.Co-AN2-AZc-PRD-SBN-PRI-WEB.id
#   private_ips     = ["10.0.7.11"]
#   security_groups = [aws_security_group.Co-PRD-PRI-WEB-SG.id]

#   tags = {
#     Name = "Co-AN2-AZc-PRD-PRI-WEB-EC2-eni"
#   }
# }

# ## WEB2 EC2 생성 ##
# resource "aws_instance" "Co-AN2-AZc-PRD-PRI-WEB-EC2" {
#   ami           = "ami-0ff1cd0b5d98708d1" //Amazon 2023 AMI latest)
#   instance_type = "t3.small"              // 2vcpu,2G
#   key_name      = "MyKeyPair"             //**미리 생성한 키 사용 (꼭 자신이 만든 키 Name 입력)**
#   # user_data     = data.template_file.web_user_data.rendered //사용자 데이터 지정 (WEB 서버 구성)
#   user_data = <<-EOF
#   #!/bin/bash

#   # Apache 웹 서버 설치
#   sudo yum update -y
#   sudo yum install httpd -y

#   # Apache 서버 시작
#   sudo systemctl start httpd

#   # 부팅 시 자동 시작 설정
#   sudo systemctl enable httpd

#   echo "Hello, ETEVERS IaC HoL Server-2!" > /var/www/html/index.html
#   EOF

#   network_interface { // ENI 지정
#     network_interface_id = aws_network_interface.Co-AN2-AZc-PRD-PRI-WEB-EC2-eni.id
#     device_index         = 0
#   }

#   ## EBS 정의
#   root_block_device {
#     volume_size           = "30"
#     volume_type           = "gp3"
#     encrypted             = false
#     delete_on_termination = true //EC2 삭제시 함께 제거
#   }

#   tags = {
#     Name = "Co-AN2-AZc-PRD-PRI-WEB-EC2"
#   }
# }
