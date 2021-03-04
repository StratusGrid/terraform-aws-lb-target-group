variable "target_group_name_prefix" {
  description = "name prefix (pre-random) of target group to be created"
  type        = string
}

variable "target_group_type" {
  description = "Target type (ip/instance, lambda is not supported by this module) "
  type        = string
  default     = "ip"
}

variable "vpc_id" {
  description = "ID of VPC which the resource should be created in"
  type        = string
}

variable "target_group_port" {
  description = "Port configuration for LB Target group"
  type        = number
  default     = 443
}

variable "target_group_protocol" {
  description = "Protocol configuration for LB Target group"
  type        = string
  default     = "HTTPS"
}

variable "target_group_health_protocol" {
  description = "Override protocol for health check, otherwise this will match traffic protocol"
  type        = string
  default     = ""
}

variable "target_group_health_interval" {
  description = "Interval for health checks"
  type        = number
  default     = 10
}

variable "target_group_health_path" {
  description = "Path for health checks"
  type        = string
  default     = "/"
}

variable "target_group_health_port" {
  description = "Override port for health check, otherwise this will be traffic port."
  type        = string
  default     = "traffic-port"
}

variable "target_group_health_timeout" {
  description = "Override timeout for health check for health check, otherwise this will be one second."
  type        = number
  default     = 5
}

variable "target_group_health_response" {
  description = "Response code for health indicator. Can be single, comma separated, or ranges. Default is 200"
  type        = string
  default     = 200
}

variable "target_group_gc_healthy_threshold" {
  description = "Number of consecutive health checks successes required before considering an unhealthy target healthy. Default is 3"
  type        = number
  default     = 3
}

variable "target_group_gc_unhealthy_threshold" {
  description = "Number of consecutive health check failures required before considering the target unhealthy. Default is 3"
  type        = number
  default     = 3
}

variable "input_tags" {
  description = "Map of tags to apply to resources"
  type        = map(string)
  default = {
    Developer   = "StratusGrid"
    Provisioner = "Terraform"
  }
}

variable "stickiness" {
  description = "Stickiness configuration block to use"
  type        = map(string)
  default     = {}
}
