#!/bin/bash

# Создаем namespace для ролей (если нужно)
kubectl create namespace rbac-namespace

# Роль для DevOps
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: devops-role
  namespace: rbac-namespace
rules:
- apiGroups: ["*"]
  resources: ["*"]
  verbs: ["*"]
- apiGroups: [""]
  resources: ["secrets"]
  verbs: ["get", "list", "watch"]
EOF

# Роль для SecOps
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: secops-role
  namespace: rbac-namespace
rules:
- apiGroups: [""]
  resources: ["secrets"]
  verbs: ["*"]
EOF

# Роль для Support
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: support-role
  namespace: rbac-namespace
rules:
- apiGroups: ["*"]
  resources: ["*"]
  verbs: ["get", "list", "watch"]
- apiGroups: [""]
  resources: ["secrets"]
  verbs: ["none"]
EOF