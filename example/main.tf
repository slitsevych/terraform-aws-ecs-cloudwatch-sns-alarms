locals {
  region       = "us-east-2"
  cluster_name = "##YOUR ECS Cluster name"
  service_name = "##YOUR ECS Service name"
  sns_topic    = "##YOUR SNS TOPIC ARN"
}

provider "aws" {
  region  = local.region
}

module "ecs_cloudwatch_sns_alarms" {
  source       = "../"

  cluster_name = local.cluster_name
  service_name = local.service_name

  default_sns_topics = [local.sns_topic]
}
