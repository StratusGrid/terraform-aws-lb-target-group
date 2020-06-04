output "target_group_id" {
  description = "ID of target group created by module."
  value       = aws_lb_target_group.this.id
}

output "target_group_arn" {
  description = "ARN of target group created by module."
  value       = aws_lb_target_group.this.arn
}

output "target_group_port" {
  description = "Destination port of the targets of target group created by module."
  value       = aws_lb_target_group.this.port
}
