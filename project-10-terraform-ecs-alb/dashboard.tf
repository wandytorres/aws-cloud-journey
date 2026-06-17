resource "aws_cloudwatch_dashboard" "ecs_dashboard" {
  dashboard_name = "${var.project_name}-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          title = "ECS CPU Utilization"
          metrics = [
            [
              "AWS/ECS",
              "CPUUtilization",
              "ClusterName", aws_ecs_cluster.main.name,
              "ServiceName", aws_ecs_service.app.name
            ]
          ]
          period = 60
          stat   = "Average"
          region = var.aws_region
        }
      },

      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6

        properties = {
          title = "ECS Memory Utilization"
          metrics = [
            [
              "AWS/ECS",
              "MemoryUtilization",
              "ClusterName", aws_ecs_cluster.main.name,
              "ServiceName", aws_ecs_service.app.name
            ]
          ]
          period = 60
          stat   = "Average"
          region = var.aws_region
        }
      },

      {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 12
        height = 6

        properties = {
          title = "ALB Request Count"
          metrics = [
            [
              "AWS/ApplicationELB",
              "RequestCount",
              "LoadBalancer", aws_lb.app.arn_suffix
            ]
          ]
          period = 60
          stat   = "Sum"
          region = var.aws_region
        }
      },

      {
        type   = "metric"
        x      = 12
        y      = 6
        width  = 12
        height = 6

        properties = {
          title = "ALB 5XX Errors"
          metrics = [
            [
              "AWS/ApplicationELB",
              "HTTPCode_ELB_5XX_Count",
              "LoadBalancer", aws_lb.app.arn_suffix
            ]
          ]
          period = 60
          stat   = "Sum"
          region = var.aws_region
        }
      }
    ]
  })
}
