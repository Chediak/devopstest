variable "environment" {
  description = "Environment name"
  type        = string
}

variable "bucket_name" {
  description = "Name for the S3 bucket"
  type        = string
}

variable "eks_role_id" {
  description = "IAM role ID of the EKS cluster"
  type        = string
} 