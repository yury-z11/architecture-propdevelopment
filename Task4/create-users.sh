#!/bin/bash

mkdir ./gen_certs

# Создаем сертификаты для пользователей
openssl genrsa -out ./gen_certs/devops.key 2048
openssl req -new -key ./gen_certs/devops.key -out ./gen_certs/devops.csr -subj "/CN=devops-user/O=devops-group"
openssl x509 -req -in ./gen_certs/devops.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out ./gen_certs/devops.crt -days 365

openssl genrsa -out ./gen_certs/secops.key 2048
openssl req -new -key ./gen_certs/secops.key -out ./gen_certs/secops.csr -subj "/CN=secops-user/O=secops-group"
openssl x509 -req -in ./gen_certs/secops.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out ./gen_certs/secops.crt -days 365

openssl genrsa -out ./gen_certs/support.key 2048
openssl req -new -key ./gen_certs/support.key -out ./gen_certs/support.csr -subj "/CN=support-user/O=support-group"
openssl x509 -req -in ./gen_certs/support.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out ./gen_certs/support.crt -days 365

# Создаем учетные записи в Kubernetes
kubectl config set-credentials devops-user --client-certificate=devops.crt --client-key=./gen_certs/devops.key
kubectl config set-credentials secops-user --client-certificate=secops.crt --client-key=./gen_certs/secops.key
kubectl config set-credentials support-user --client-certificate=support.crt --client-key=./gen_certs/support.key