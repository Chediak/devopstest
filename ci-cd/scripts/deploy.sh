#!/bin/bash

aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set region $AWS_REGION

aws eks update-kubeconfig --name $CLUSTER_NAME

kubectl apply -f kubernetes/manifests/secrets.yaml

kubectl apply -f kubernetes/manifests/datadog-configmap.yaml

kubectl apply -f kubernetes/manifests/deployment.yaml
kubectl apply -f kubernetes/manifests/service.yaml
kubectl apply -f kubernetes/manifests/ingress.yaml
kubectl apply -f kubernetes/manifests/hpa.yaml

kubectl rollout status deployment/flowise

kubectl get pods -l app=flowise

kubectl get svc flowise

kubectl get ingress flowise 