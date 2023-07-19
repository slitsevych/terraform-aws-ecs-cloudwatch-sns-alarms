locals {
  thresholds = {
    CPUUtilizationHighThreshold    = min(max(var.cpu_utilization_high_threshold, 0), 100)
    CPUUtilizationLowThreshold     = min(max(var.cpu_utilization_low_threshold, 0), 100)
    MemoryUtilizationHighThreshold = min(max(var.memory_utilization_high_threshold, 0), 100)
    MemoryUtilizationLowThreshold  = min(max(var.memory_utilization_low_threshold, 0), 100)
  }

  dimensions_map = {
    "service" = {
      "ClusterName" = var.cluster_name
      "ServiceName" = var.service_name
    }
    "cluster" = {
      "ClusterName" = var.cluster_name
    }
  }

  cpu_utilization_high_alarm_actions    = length(var.default_sns_topics) > 0 ? concat(var.default_sns_topics, var.cpu_utilization_high_alarm_actions) : var.cpu_utilization_high_alarm_actions
  cpu_utilization_high_ok_actions       = length(var.default_sns_topics) > 0 ? concat(var.default_sns_topics, var.cpu_utilization_high_ok_actions) : var.cpu_utilization_high_ok_actions
  cpu_utilization_low_alarm_actions     = length(var.default_sns_topics) > 0 ? concat(var.default_sns_topics, var.cpu_utilization_low_alarm_actions) : var.cpu_utilization_low_alarm_actions
  cpu_utilization_low_ok_actions        = length(var.default_sns_topics) > 0 ? concat(var.default_sns_topics, var.cpu_utilization_low_ok_actions) : var.cpu_utilization_low_ok_actions
  memory_utilization_high_alarm_actions = length(var.default_sns_topics) > 0 ? concat(var.default_sns_topics, var.memory_utilization_high_alarm_actions) : var.memory_utilization_high_alarm_actions
  memory_utilization_high_ok_actions    = length(var.default_sns_topics) > 0 ? concat(var.default_sns_topics, var.memory_utilization_high_ok_actions) : var.memory_utilization_high_ok_actions
  memory_utilization_low_alarm_actions  = length(var.default_sns_topics) > 0 ? concat(var.default_sns_topics, var.memory_utilization_low_alarm_actions) : var.memory_utilization_low_alarm_actions
  memory_utilization_low_ok_actions     = length(var.default_sns_topics) > 0 ? concat(var.default_sns_topics, var.memory_utilization_low_ok_actions) : var.memory_utilization_low_ok_actions
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_high" {
  alarm_name          = "${var.service_name}-cpu_utilization_high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.cpu_utilization_high_evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = var.cpu_utilization_high_period
  statistic           = "Average"
  threshold           = local.thresholds["CPUUtilizationHighThreshold"]

  alarm_description = format(
    var.alarm_description,
    "CPU",
    "High",
    var.cpu_utilization_high_period / 60,
    var.cpu_utilization_high_evaluation_periods
  )

  alarm_actions = compact(local.cpu_utilization_high_alarm_actions)
  ok_actions    = compact(local.cpu_utilization_high_ok_actions)

  dimensions = local.dimensions_map[var.service_name == "" ? "cluster" : "service"]
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_low" {
  alarm_name          = "${var.service_name}-cpu_utilization_low"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = var.cpu_utilization_low_evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = var.cpu_utilization_low_period
  statistic           = "Average"
  threshold           = local.thresholds["CPUUtilizationLowThreshold"]

  alarm_description = format(
    var.alarm_description,
    "CPU",
    "Low",
    var.cpu_utilization_low_period / 60,
    var.cpu_utilization_low_evaluation_periods
  )

  alarm_actions = compact(local.cpu_utilization_low_alarm_actions)
  ok_actions    = compact(local.cpu_utilization_low_ok_actions)

  dimensions = local.dimensions_map[var.service_name == "" ? "cluster" : "service"]
}

resource "aws_cloudwatch_metric_alarm" "memory_utilization_high" {
  alarm_name          = "${var.service_name}-memory_utilization_high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.memory_utilization_high_evaluation_periods
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = var.memory_utilization_high_period
  statistic           = "Average"
  threshold           = local.thresholds["MemoryUtilizationHighThreshold"]

  alarm_description = format(
    var.alarm_description,
    "Memory",
    "Hight",
    var.memory_utilization_high_period / 60,
    var.memory_utilization_high_evaluation_periods
  )

  alarm_actions = compact(local.memory_utilization_high_alarm_actions)
  ok_actions    = compact(local.memory_utilization_high_ok_actions)

  dimensions = local.dimensions_map[var.service_name == "" ? "cluster" : "service"]
}

resource "aws_cloudwatch_metric_alarm" "memory_utilization_low" {
  alarm_name          = "${var.service_name}-memory_utilization_low"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = var.memory_utilization_low_evaluation_periods
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = var.memory_utilization_low_period
  statistic           = "Average"
  threshold           = local.thresholds["MemoryUtilizationLowThreshold"]

  alarm_description = format(
    var.alarm_description,
    "Memory",
    "Low",
    var.memory_utilization_low_period / 60,
    var.memory_utilization_low_evaluation_periods
  )

  alarm_actions = compact(local.memory_utilization_low_alarm_actions)
  ok_actions    = compact(local.memory_utilization_low_ok_actions)

  dimensions = local.dimensions_map[var.service_name == "" ? "cluster" : "service"]
}
