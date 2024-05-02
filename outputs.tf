output "target_group_id" {
  description = "ID of target group created by module."
  value       = aws_lb_target_group.this.id
}

output "target_group_arn" {
  description = "ARN of target group created by module."
  value       = aws_lb_target_group.this.arn
}

output "target_group_arn_suffix" {
  description = "ARN suffix for use with CloudWatch Metrics"
  value       = aws_lb_target_group.this.arn_suffix
}

output "target_group_name" {
  description = "Name of target group created by module."
  value       = aws_lb_target_group.this.name
}

output "target_group_port" {
  description = "Destination port of the targets of target group created by module."
  value       = aws_lb_target_group.this.port
}
