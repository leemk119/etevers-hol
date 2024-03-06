# ## Auto Scaling Group 생성 ##
# resource "aws_autoscaling_group" "Co-AN2-PRD-WEB-ASG" {
#   name = "Co-AN2-PRD-WEB-ASG" // ASG 이름 정의

#   launch_template { // 시작 템플릿 정의
#     id      = aws_launch_template.Co-AN2-PRD-WEB-LT.id
#     version = aws_launch_template.Co-AN2-PRD-WEB-LT.latest_version
#   }

#   vpc_zone_identifier = [ // 서브넷 정의
#     aws_subnet.Co-AN2-AZa-PRD-SBN-PRI-WEB.id,
#     aws_subnet.Co-AN2-AZc-PRD-SBN-PRI-WEB.id
#   ]

#   min_size         = 1 // ASG에서 관리하는 최소 인스턴스 개수 
#   max_size         = 3 // ASG에서 관리하는 최대 인스턴스 개수
#   desired_capacity = 1 // ASG에서 관리하는 초기 인스턴스 개수

#   target_group_arns = [aws_lb_target_group.Co-AN2-PRD-WEB-EXT-TGRP-80.arn] // ALB 타겟 그룹 arn 정의

#   ## ELB 상태 검사 옵션
#   health_check_type         = "ELB"                                           // ELB의 상태 검사 사용
#   health_check_grace_period = 300                                             // unhealth 상태에서 종료되기 전 대기 시간(초)
#   termination_policies      = ["OldestInstance", "ClosestToNextInstanceHour"] // 인스턴스 종료 순서 규칙: 가장 오래된 인스턴스, 인스턴스 과금 시간
# }

# # Auto Scaling 정책 정의
# resource "aws_autoscaling_policy" "cpu_based_scaling_high" { // CPU 사용률 임계값 초과 시 증가
#   name                   = "cpu_based_scaling_high"
#   scaling_adjustment     = 1
#   adjustment_type        = "ChangeInCapacity"
#   cooldown               = 150 // 인스턴스가 확장/축소 시작되는 시간(잦은 인스턴스 조정 방지)
#   autoscaling_group_name = aws_autoscaling_group.Co-AN2-PRD-WEB-ASG.name

#   policy_type = "SimpleScaling"
# }

# # Auto Scaling 정책 정의
# resource "aws_autoscaling_policy" "cpu_based_scaling_low" { // CPU 사용률 임계값 감소 시 증가
#   name                   = "cpu_based_scaling_low"
#   scaling_adjustment     = -1
#   adjustment_type        = "ChangeInCapacity"
#   cooldown               = 150
#   autoscaling_group_name = aws_autoscaling_group.Co-AN2-PRD-WEB-ASG.name

#   policy_type = "SimpleScaling"
# }


# # CloudWatch 지표 알람 정의
# resource "aws_cloudwatch_metric_alarm" "cpu_utilization_alarm_high" { // CPU 사용률이 높은 경우 ASG 정책 트리거
#   alarm_name          = "cpu-utilization-alarm-high"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "1" // 데이터 평가 포인트로 알람 상태 결정(1회후 결정)
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/EC2"
#   period              = "120"     // CloudWatch alarm이 데이터 평가 (default 300)
#   statistic           = "Maximum" // "Average" 급격한 CPU 사용률 증가를 위한 Maximum 사용
#   threshold           = 70
#   alarm_description   = "This metric monitors CPU utilization on EC2 instances."
#   alarm_actions       = [aws_autoscaling_policy.cpu_based_scaling_high.arn]
#   dimensions = {
#     AutoScalingGroupName = aws_autoscaling_group.Co-AN2-PRD-WEB-ASG.name
#   }
# }

# resource "aws_cloudwatch_metric_alarm" "cpu_utilization_alarm_low" { // CPU 사용률이 낮은 경우 ASG 정책 트리거
#   alarm_name          = "cpu-utilization-alarm-low"
#   comparison_operator = "LessThanOrEqualToThreshold"
#   evaluation_periods  = "1"
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/EC2"
#   period              = "120"
#   statistic           = "Maximum"
#   threshold           = 30
#   alarm_description   = "This metric monitors CPU utilization on EC2 instances."
#   alarm_actions       = [aws_autoscaling_policy.cpu_based_scaling_low.arn]
#   dimensions = {
#     AutoScalingGroupName = aws_autoscaling_group.Co-AN2-PRD-WEB-ASG.name
#   }
# }
