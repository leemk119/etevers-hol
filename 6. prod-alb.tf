## WEB서버 앞에 위치하는 ALB 생성 ##
resource "aws_lb" "Co-AN2-PRD-WEB-EXT-ALB" {
  name               = "Co-AN2-PRD-WEB-EXT-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.Co-PRD-PUB-SG.id}"] //보안그룹 지정

  # access_logs { // 액세스 로그 설정: ALB에서 발생하는 트래픽 로그 수집 (HoL에서는 사용 안함)
  #   bucket  = "etevershol-alb-logs"
  #   prefix  = "etevershol-app-lb"
  #   enabled = false
  # }

  subnets = [
    aws_subnet.Co-AN2-AZa-PRD-SBN-PUB.id,
    aws_subnet.Co-AN2-AZc-PRD-SBN-PUB.id
  ]
}

resource "aws_lb_listener" "Co-AN2-PRD-WEB-EXT-LSNR-80" {
  load_balancer_arn = aws_lb.Co-AN2-PRD-WEB-EXT-ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Co-AN2-PRD-WEB-EXT-TGRP-80.arn
  }
}

resource "aws_lb_target_group" "Co-AN2-PRD-WEB-EXT-TGRP-80" {
  name       = "Co-AN2-PRD-WEB-EXT-TGRP-80"
  port       = 80
  protocol   = "HTTP"
  vpc_id     = aws_vpc.Co-AN2-PRD-VPC.id
  slow_start = 0

  load_balancing_algorithm_type = "round_robin" //트래픽 분배 방식 정의

  stickiness {
    enabled = false
    type    = "lb_cookie"
  }

  health_check {
    enabled             = true
    port                = 80
    interval            = 10
    protocol            = "HTTP"
    path                = "/"
    matcher             = "200"
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

## 인스턴스 연결
resource "aws_lb_target_group_attachment" "Co-AN2-PRD-WEB-EXT-TGRP-HTTP-ATTACH01" {
  target_group_arn = aws_lb_target_group.Co-AN2-PRD-WEB-EXT-TGRP-80.arn
  target_id        = aws_instance.Co-AN2-AZa-PRD-PRI-WEB-EC2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "Co-AN2-PRD-WEB-EXT-TGRP-HTTP-ATTACH02" {
  target_group_arn = aws_lb_target_group.Co-AN2-PRD-WEB-EXT-TGRP-80.arn
  target_id        = aws_instance.Co-AN2-AZc-PRD-PRI-WEB-EC2.id
  port             = 80
}
