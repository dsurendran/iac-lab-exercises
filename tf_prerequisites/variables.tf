variable "region" {
  type        = string
  description = "Region to deploy iac solution"
  default     = "ap-south-1"
}

variable "prefix" {
  type        = string
  description = "s3 prefix"
}

variable "repo_name" {
  type        = string
  description = "git repository name"
}
