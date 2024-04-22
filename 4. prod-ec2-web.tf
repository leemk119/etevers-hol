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
#   ami           = "ami-04c596dcf23eb98d8" //Amazon 2023 AMI latest)
#   instance_type = "t3.small"              // 2vcpu,2G
#   key_name      = "MyKeyPair"             //**꼭 자신이 만든 키 Name 입력**
#   user_data = <<-EOF
#   #!/bin/bash

#   sudo yum update -y
#   sudo yum install httpd -y

#   sudo systemctl start httpd
#   sudo systemctl enable httpd

#   echo "Hello, ETEVERS IaC HoL Server-1!" > /var/www/html/index.html
#   EOF

#   network_interface {
#     network_interface_id = aws_network_interface.Co-AN2-AZa-PRD-PRI-WEB-EC2-eni.id
#     device_index         = 0
#   }

#   ## EBS 정의
#   root_block_device {
#     volume_size           = "30"
#     volume_type           = "gp3"
#     encrypted             = false
#     delete_on_termination = true
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
#   ami           = "ami-04c596dcf23eb98d8" //Amazon 2023 AMI latest)
#   instance_type = "t3.small"              // 2vcpu,2G
#   key_name      = "MyKeyPair"             //**미리 생성한 키 사용 (꼭 자신이 만든 키 Name 입력)**
#   user_data = <<-EOF
#   #!/bin/bash

#   sudo yum update -y
#   sudo yum install httpd -y

#   sudo systemctl start httpd
#   sudo systemctl enable httpd

#   echo "Hello, ETEVERS IaC HoL Server-2!" > /var/www/html/index.html
#   EOF

#   network_interface {
#     network_interface_id = aws_network_interface.Co-AN2-AZc-PRD-PRI-WEB-EC2-eni.id
#     device_index         = 0
#   }

#   ## EBS 정의
#   root_block_device {
#     volume_size           = "30"
#     volume_type           = "gp3"
#     encrypted             = false
#     delete_on_termination = true
#   }

#   tags = {
#     Name = "Co-AN2-AZc-PRD-PRI-WEB-EC2"
#   }
# }
