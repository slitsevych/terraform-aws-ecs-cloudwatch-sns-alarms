output "cpu_utilization_high_cloudwatch_metric_alarm_id" {
  value       = module.ecs_cloudwatch_sns_alarms.cpu_utilization_high_cloudwatch_metric_alarm_id
  description = "CPU utilization high CloudWatch metric alarm ID"
}

output "cpu_utilization_high_cloudwatch_metric_alarm_arn" {
  value       = module.ecs_cloudwatch_sns_alarms.cpu_utilization_high_cloudwatch_metric_alarm_arn
  description = "CPU utilization high CloudWatch metric alarm ARN"
}

output "cpu_utilization_low_cloudwatch_metric_alarm_id" {
  value       = module.ecs_cloudwatch_sns_alarms.cpu_utilization_low_cloudwatch_metric_alarm_id
  description = "CPU utilization low CloudWatch metric alarm ID"
}

output "cpu_utilization_low_cloudwatch_metric_alarm_arn" {
  value       = module.ecs_cloudwatch_sns_alarms.cpu_utilization_low_cloudwatch_metric_alarm_arn
  description = "CPU utilization low CloudWatch metric alarm ARN"
}

output "memory_utilization_high_cloudwatch_metric_alarm_id" {
  value       = module.ecs_cloudwatch_sns_alarms.memory_utilization_high_cloudwatch_metric_alarm_id
  description = "Memory utilization high CloudWatch metric alarm ID"
}

output "memory_utilization_high_cloudwatch_metric_alarm_arn" {
  value       = module.ecs_cloudwatch_sns_alarms.memory_utilization_high_cloudwatch_metric_alarm_arn
  description = "Memory utilization high CloudWatch metric alarm ARN"
}

output "memory_utilization_low_cloudwatch_metric_alarm_id" {
  value       = module.ecs_cloudwatch_sns_alarms.memory_utilization_low_cloudwatch_metric_alarm_id
  description = "Memory utilization low CloudWatch metric alarm ID"
}

output "memory_utilization_low_cloudwatch_metric_alarm_arn" {
  value       = module.ecs_cloudwatch_sns_alarms.memory_utilization_low_cloudwatch_metric_alarm_arn
  description = "Memory utilization low CloudWatch metric alarm ARN"
}
