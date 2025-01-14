variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "subnet IDs"
  type        = list(string)
}

variable "eks_security_group_id" {
  description = "Security group ID EKS"
  type        = string
}

variable "db_username" {
  description = "Username RDS"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Pass for the RDS"
  type        = string
  sensitive   = true
}

variable "snapshot_identifier" {
  description = "dbsnapshot"
  type        = string
  default     = null
} 