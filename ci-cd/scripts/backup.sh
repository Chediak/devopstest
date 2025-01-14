#!/bin/bash

aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set region $AWS_REGION

TIMESTAMP=$(date +%Y-%m-%d-%H-%M)
aws rds create-db-snapshot \
  --db-instance-identifier $RDS_INSTANCE_ID \
  --db-snapshot-identifier "flowise-backup-${TIMESTAMP}"

aws rds wait db-snapshot-available \
  --db-snapshot-identifier "flowise-backup-${TIMESTAMP}"

aws rds copy-db-snapshot \
  --source-db-snapshot-identifier "flowise-backup-${TIMESTAMP}" \
  --target-db-snapshot-identifier "flowise-backup-${TIMESTAMP}" \
  --source-region $AWS_REGION \
  --region $BACKUP_REGION 