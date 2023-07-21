output "cpu_utilization_high_cloudwatch_metric_alarm_id" {
  value       = aws_cloudwatch_metric_alarm.cpu_utilization_high.id
  description = "CPU utilization high CloudWatch metric alarm ID"
}

output "cpu_utilization_high_cloudwatch_metric_alarm_arn" {
  value       = aws_cloudwatch_metric_alarm.cpu_utilization_high.arn
  description = "CPU utilization high CloudWatch metric alarm ARN"
}

output "cpu_utilization_low_cloudwatch_metric_alarm_id" {
  value       = aws_cloudwatch_metric_alarm.cpu_utilization_low.id
  description = "CPU utilization low CloudWatch metric alarm ID"
}

output "cpu_utilization_low_cloudwatch_metric_alarm_arn" {
  value       = aws_cloudwatch_metric_alarm.cpu_utilization_low.arn
  description = "CPU utilization low CloudWatch metric alarm ARN"
}

output "memory_utilization_high_cloudwatch_metric_alarm_id" {
  value       = aws_cloudwatch_metric_alarm.memory_utilization_high.id
  description = "Memory utilization high CloudWatch metric alarm ID"
}

output "memory_utilization_high_cloudwatch_metric_alarm_arn" {
  value       = aws_cloudwatch_metric_alarm.memory_utilization_high.arn
  description = "Memory utilization high CloudWatch metric alarm ARN"
}

output "memory_utilization_low_cloudwatch_metric_alarm_id" {
  value       = aws_cloudwatch_metric_alarm.memory_utilization_low.id
  description = "Memory utilization low CloudWatch metric alarm ID"
}

output "memory_utilization_low_cloudwatch_metric_alarm_arn" {
  value       = aws_cloudwatch_metric_alarm.memory_utilization_low.arn
  description = "Memory utilization low CloudWatch metric alarm ARN"
}

output "ecs_alarms_list" {
  description = "The list of all alarms"
  value = [
    [aws_cloudwatch_metric_alarm.cpu_utilization_high.arn],
    [aws_cloudwatch_metric_alarm.cpu_utilization_low.arn],
    [aws_cloudwatch_metric_alarm.memory_utilization_high.arn],
    [aws_cloudwatch_metric_alarm.memory_utilization_low.arn]
  ]
}