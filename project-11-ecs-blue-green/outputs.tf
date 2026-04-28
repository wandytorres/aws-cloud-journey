output "alb_dns_name" {
  value = aws_lb.app.dns_name
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "blue_service_name" {
  value = aws_ecs_service.blue.name
}

output "green_service_name" {
  value = aws_ecs_service.green.name
}

output "blue_target_group" {
  value = aws_lb_target_group.blue.name
}

output "green_target_group" {
  value = aws_lb_target_group.green.name
}
