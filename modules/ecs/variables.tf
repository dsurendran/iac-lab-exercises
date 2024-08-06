
variable "prefix" {
  type        = string
  description = "vpc-tag"
}

variable "region" {
  type        = string
  description = "Region to deploy iac solution"
}

variable "private_subnet_ids" {
  type        = list(any)
  description = "list of private subnets"
}

variable "aws_lb_target_group_arn" {
  type        = string
  description = "aws_lb_target_group_arn"
}

variable "vpc_id" {
  type        = string
  description = "vpc id"
}

variable "alb_security_group_id" {
  type        = list(any)
  description = "lb security group ids"
}

variable "db_address" {
  type        = string
  description = "host name of database"
}

variable "db_name" {
  type        = string
  description = "name of database"
}

variable "db_username" {
  type        = string
  description = "database user name"
}

variable "db_secret_arn" {
  type        = string
  description = "database secret arn"
}

variable "db_secret_key_id" {
  type        = string
  description = "db_secret_key_id"
}
