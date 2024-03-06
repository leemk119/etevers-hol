## EC2 템플릿 신규 생성##
resource "aws_launch_template" "Co-AN2-PRD-WEB-LT" {
  name_prefix                 = "Co-AN2-PRD-WEB-LT"     // EC2 템플릿(Launch configuration) 이름 지정 
  image_id                    = "ami-0ff1cd0b5d98708d1" //Amazon 2023 AMI (latest)
  instance_type               = "t3.small" // "t3.small"
  key_name                    = "STA" //**꼭 자신이 만든 키 Name 입력**MyKeyPair
  
  vpc_security_group_ids = [aws_security_group.Co-PRD-PRI-WEB-SG.id]

  user_data = data.template_file.web_user_data.rendered
  
  ebs_optimized = true
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 30   
      delete_on_termination = true
      volume_type = "gp3"
    }
  }
  monitoring {
    enabled = false
  }

  tag_specifications {
    resource_type = "instance" // 태그 적용될 리소스
    tags = {
      Name = "ASLT-WEB-EC2"
    }
  }

}
