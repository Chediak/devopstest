# Configuração do provider AWS
provider "aws" {
  region = var.aws_region
}

# Módulo VPC
module "vpc" {
  source = "./modules/vpc"
  
  environment    = var.environment
  vpc_cidr      = var.vpc_cidr
  azs           = var.availability_zones
}

# Módulo RDS
module "rds" {
  source = "./modules/rds"
  
  vpc_id        = module.vpc.vpc_id
  subnet_ids    = module.vpc.private_subnet_ids
  environment   = var.environment
  db_username   = var.db_username
  db_password   = var.db_password
  eks_security_group_id = module.eks.cluster_security_group_id
}

# Módulo EKS
module "eks" {
  source = "./modules/eks"
  
  vpc_id        = module.vpc.vpc_id
  subnet_ids    = module.vpc.private_subnet_ids
  cluster_name  = var.cluster_name
  environment   = var.environment
}

# Módulo S3
module "s3" {
  source = "./modules/s3"
  
  bucket_name   = var.bucket_name
  environment   = var.environment
  eks_role_id   = module.eks.cluster_role_id
}

# Módulo WAF
module "waf" {
  source = "./modules/waf"
  
  environment   = var.environment
  alb_arn      = module.eks.alb_arn
} 