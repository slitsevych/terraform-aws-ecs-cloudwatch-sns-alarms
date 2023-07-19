# Information

Simplified variant of [cloudposse/terraform-aws-ecs-cloudwatch-sns-alarms](https://github.com/cloudposse/terraform-aws-ecs-cloudwatch-sns-alarms) module with small additions:

- added `default_sns_topics` variable (list of strings) which allows to indicate only one topic which will be then passed to all **ok/alarm** actions
- changed **alarm_name** argument to a more simple variant where var.service_name is prefixed to the actual alarm name (e.g `"${var.service_name}-cpu_utilization_low"`)
- removed **count** conditionals from resources implying that we're using this module to actually create resources
- slightly changed default threshold/alarm values

For a complete example, see the `example/` folder.

## Basic example

```hcl
locals {
  region       = "us-east-2"
  cluster_name = "my_cluster" # should already exist
  service_name = "my_service" # should already exist
  sns_topic    = "arn:aws:sns:us-east-2:968521256074:devops-notifications"
}

provider "aws" {
  region  = local.region
}

module "sns" {
  source = "terraform-aws-modules/sns/aws"
  name   = "default"
}

module "ecs_cloudwatch_sns_alarms" {
  source       = ""

  cluster_name = local.cluster_name
  service_name = local.service_name

  default_sns_topics = [module.sns.topic_arn]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.8.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.cpu_utilization_high](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.cpu_utilization_low](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.memory_utilization_high](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.memory_utilization_low](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alarm_description"></a> [alarm\_description](#input\_alarm\_description) | The string to format and use as the alarm description. | `string` | `"Average service %v utilization %v last %d minute(s) over %v period(s)"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the ECS cluster to monitor | `string` | n/a | yes |
| <a name="input_cpu_utilization_high_alarm_actions"></a> [cpu\_utilization\_high\_alarm\_actions](#input\_cpu\_utilization\_high\_alarm\_actions) | A list of ARNs (i.e. SNS Topic ARN) to notify on CPU Utilization High Alarm action | `list(string)` | `[]` | no |
| <a name="input_cpu_utilization_high_evaluation_periods"></a> [cpu\_utilization\_high\_evaluation\_periods](#input\_cpu\_utilization\_high\_evaluation\_periods) | Number of periods to evaluate for the alarm | `number` | `2` | no |
| <a name="input_cpu_utilization_high_ok_actions"></a> [cpu\_utilization\_high\_ok\_actions](#input\_cpu\_utilization\_high\_ok\_actions) | A list of ARNs (i.e. SNS Topic ARN) to notify on CPU Utilization High OK action | `list(string)` | `[]` | no |
| <a name="input_cpu_utilization_high_period"></a> [cpu\_utilization\_high\_period](#input\_cpu\_utilization\_high\_period) | Duration in seconds to evaluate for the alarm | `number` | `180` | no |
| <a name="input_cpu_utilization_high_threshold"></a> [cpu\_utilization\_high\_threshold](#input\_cpu\_utilization\_high\_threshold) | The maximum percentage of CPU utilization average | `number` | `80` | no |
| <a name="input_cpu_utilization_low_alarm_actions"></a> [cpu\_utilization\_low\_alarm\_actions](#input\_cpu\_utilization\_low\_alarm\_actions) | A list of ARNs (i.e. SNS Topic ARN) to notify on CPU Utilization Low Alarm action | `list(string)` | `[]` | no |
| <a name="input_cpu_utilization_low_evaluation_periods"></a> [cpu\_utilization\_low\_evaluation\_periods](#input\_cpu\_utilization\_low\_evaluation\_periods) | Number of periods to evaluate for the alarm | `number` | `2` | no |
| <a name="input_cpu_utilization_low_ok_actions"></a> [cpu\_utilization\_low\_ok\_actions](#input\_cpu\_utilization\_low\_ok\_actions) | A list of ARNs (i.e. SNS Topic ARN) to notify on CPU Utilization Low OK action | `list(string)` | `[]` | no |
| <a name="input_cpu_utilization_low_period"></a> [cpu\_utilization\_low\_period](#input\_cpu\_utilization\_low\_period) | Duration in seconds to evaluate for the alarm | `number` | `180` | no |
| <a name="input_cpu_utilization_low_threshold"></a> [cpu\_utilization\_low\_threshold](#input\_cpu\_utilization\_low\_threshold) | The minimum percentage of CPU utilization average | `number` | `20` | no |
| <a name="input_default_sns_topics"></a> [default\_sns\_topics](#input\_default\_sns\_topics) | A list of SNS topics (i.e. SNS Topic ARN) to notify to use for ALL ok and alarm actions | `list(string)` | `[]` | no |
| <a name="input_memory_utilization_high_alarm_actions"></a> [memory\_utilization\_high\_alarm\_actions](#input\_memory\_utilization\_high\_alarm\_actions) | A list of ARNs (i.e. SNS Topic ARN) to notify on Memory Utilization High Alarm action | `list(string)` | `[]` | no |
| <a name="input_memory_utilization_high_evaluation_periods"></a> [memory\_utilization\_high\_evaluation\_periods](#input\_memory\_utilization\_high\_evaluation\_periods) | Number of periods to evaluate for the alarm | `number` | `2` | no |
| <a name="input_memory_utilization_high_ok_actions"></a> [memory\_utilization\_high\_ok\_actions](#input\_memory\_utilization\_high\_ok\_actions) | A list of ARNs (i.e. SNS Topic ARN) to notify on Memory Utilization High OK action | `list(string)` | `[]` | no |
| <a name="input_memory_utilization_high_period"></a> [memory\_utilization\_high\_period](#input\_memory\_utilization\_high\_period) | Duration in seconds to evaluate for the alarm | `number` | `180` | no |
| <a name="input_memory_utilization_high_threshold"></a> [memory\_utilization\_high\_threshold](#input\_memory\_utilization\_high\_threshold) | The maximum percentage of Memory utilization average | `number` | `80` | no |
| <a name="input_memory_utilization_low_alarm_actions"></a> [memory\_utilization\_low\_alarm\_actions](#input\_memory\_utilization\_low\_alarm\_actions) | A list of ARNs (i.e. SNS Topic ARN) to notify on Memory Utilization Low Alarm action | `list(string)` | `[]` | no |
| <a name="input_memory_utilization_low_evaluation_periods"></a> [memory\_utilization\_low\_evaluation\_periods](#input\_memory\_utilization\_low\_evaluation\_periods) | Number of periods to evaluate for the alarm | `number` | `2` | no |
| <a name="input_memory_utilization_low_ok_actions"></a> [memory\_utilization\_low\_ok\_actions](#input\_memory\_utilization\_low\_ok\_actions) | A list of ARNs (i.e. SNS Topic ARN) to notify on Memory Utilization Low OK action | `list(string)` | `[]` | no |
| <a name="input_memory_utilization_low_period"></a> [memory\_utilization\_low\_period](#input\_memory\_utilization\_low\_period) | Duration in seconds to evaluate for the alarm | `number` | `180` | no |
| <a name="input_memory_utilization_low_threshold"></a> [memory\_utilization\_low\_threshold](#input\_memory\_utilization\_low\_threshold) | The minimum percentage of Memory utilization average | `number` | `20` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of the ECS Service in the ECS cluster to monitor | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cpu_utilization_high_cloudwatch_metric_alarm_arn"></a> [cpu\_utilization\_high\_cloudwatch\_metric\_alarm\_arn](#output\_cpu\_utilization\_high\_cloudwatch\_metric\_alarm\_arn) | CPU utilization high CloudWatch metric alarm ARN |
| <a name="output_cpu_utilization_high_cloudwatch_metric_alarm_id"></a> [cpu\_utilization\_high\_cloudwatch\_metric\_alarm\_id](#output\_cpu\_utilization\_high\_cloudwatch\_metric\_alarm\_id) | CPU utilization high CloudWatch metric alarm ID |
| <a name="output_cpu_utilization_low_cloudwatch_metric_alarm_arn"></a> [cpu\_utilization\_low\_cloudwatch\_metric\_alarm\_arn](#output\_cpu\_utilization\_low\_cloudwatch\_metric\_alarm\_arn) | CPU utilization low CloudWatch metric alarm ARN |
| <a name="output_cpu_utilization_low_cloudwatch_metric_alarm_id"></a> [cpu\_utilization\_low\_cloudwatch\_metric\_alarm\_id](#output\_cpu\_utilization\_low\_cloudwatch\_metric\_alarm\_id) | CPU utilization low CloudWatch metric alarm ID |
| <a name="output_memory_utilization_high_cloudwatch_metric_alarm_arn"></a> [memory\_utilization\_high\_cloudwatch\_metric\_alarm\_arn](#output\_memory\_utilization\_high\_cloudwatch\_metric\_alarm\_arn) | Memory utilization high CloudWatch metric alarm ARN |
| <a name="output_memory_utilization_high_cloudwatch_metric_alarm_id"></a> [memory\_utilization\_high\_cloudwatch\_metric\_alarm\_id](#output\_memory\_utilization\_high\_cloudwatch\_metric\_alarm\_id) | Memory utilization high CloudWatch metric alarm ID |
| <a name="output_memory_utilization_low_cloudwatch_metric_alarm_arn"></a> [memory\_utilization\_low\_cloudwatch\_metric\_alarm\_arn](#output\_memory\_utilization\_low\_cloudwatch\_metric\_alarm\_arn) | Memory utilization low CloudWatch metric alarm ARN |
| <a name="output_memory_utilization_low_cloudwatch_metric_alarm_id"></a> [memory\_utilization\_low\_cloudwatch\_metric\_alarm\_id](#output\_memory\_utilization\_low\_cloudwatch\_metric\_alarm\_id) | Memory utilization low CloudWatch metric alarm ID |
<!-- END_TF_DOCS -->