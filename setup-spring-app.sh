#!/bin/sh
set -ex

#mysql 설정
echo "mysql 설정"
kubectl create secret generic mysql-secret \
    --from-literal=root_password='root' \
    --from-literal=user_password='1234'
kubectl create configmap mysql-config --from-literal=user='user'
gcloud compute disks create --size=10GB --zone=us-central1-c --project ${GCP_PROGECT_ID} mysql-disk
kubectl create -f YAML/mysql-pv.yaml
kubectl create -f YAML/mysql-deploy.yaml
kubectl create -f YAML/mysql-pvc.yaml
kubectl create -f YAML/mysql-svc.yaml

#spring-app 설정
echo "spring-app 설정"
kubectl create -f YAML/spring-app-deploy.yaml
kubectl create -f YAML/spring-app-svc.yaml

#ingress 설정
echo "ingress 설정"
chmod +x install-ingress-nginx.sh
sh install-ingress-nginx.sh
kubectl create -f YAML/nginx-ingress.yaml

kubectl get ingress nginx-ingress -o wide