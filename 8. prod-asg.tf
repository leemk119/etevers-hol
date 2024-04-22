# ## Auto Scaling Group 생성 ##
# resource "aws_autoscaling_group" "Co-AN2-PRD-WEB-ASG" {
#   name = "Co-AN2-PRD-WEB-ASG" // ASG 이름 정의

#   launch_template {
#     id      = aws_launch_template.Co-AN2-PRD-WEB-LT.id
#     version = aws_launch_template.Co-AN2-PRD-WEB-LT.latest_version
#   }

#   vpc_zone_identifier = [
#     aws_subnet.Co-AN2-AZa-PRD-SBN-PRI-WEB.id,
#     aws_subnet.Co-AN2-AZc-PRD-SBN-PRI-WEB.id
#   ]

#   min_size         = 1
#   max_size         = 3
#   desired_capacity = 1

#   target_group_arns = [aws_lb_target_group.Co-AN2-PRD-WEB-EXT-TGRP-80.arn] // ALB 타겟 그룹 arn 정의

#   ## ELB 상태 검사 옵션
#   health_check_type         = "ELB" // ELB의 상태 검사
#   health_check_grace_period = 300                                             
#   termination_policies      = ["OldestInstance", "ClosestToNextInstanceHour"]
# }

# # Auto Scaling 정책 정의
# resource "aws_autoscaling_policy" "cpu_based_scaling_high" {
#   name                   = "cpu_based_scaling_high"
#   scaling_adjustment     = 1
#   adjustment_type        = "ChangeInCapacity"
#   cooldown               = 150
#   autoscaling_group_name = aws_autoscaling_group.Co-AN2-PRD-WEB-ASG.name

#   policy_type = "SimpleScaling"
# }

# # Auto Scaling 정책 정의
# resource "aws_autoscaling_policy" "cpu_based_scaling_low" {
#   name                   = "cpu_based_scaling_low"
#   scaling_adjustment     = -1
#   adjustment_type        = "ChangeInCapacity"
#   cooldown               = 150
#   autoscaling_group_name = aws_autoscaling_group.Co-AN2-PRD-WEB-ASG.name

#   policy_type = "SimpleScaling"
# }


# # CloudWatch 지표 알람 정의
# resource "aws_cloudwatch_metric_alarm" "cpu_utilization_alarm_high" {
#   alarm_name          = "cpu-utilization-alarm-high"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "1"
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/EC2"
#   period              = "120"
#   statistic           = "Maximum"
#   threshold           = 70
#   alarm_description   = "This metric monitors CPU utilization on EC2 instances."
#   alarm_actions       = [aws_autoscaling_policy.cpu_based_scaling_high.arn]
#   dimensions = {
#     AutoScalingGroupName = aws_autoscaling_group.Co-AN2-PRD-WEB-ASG.name
#   }
# }

# resource "aws_cloudwatch_metric_alarm" "cpu_utilization_alarm_low" {
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
