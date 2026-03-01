#!/bin/bash

# Привязка роли DevOps к группе пользователей
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: devops-binding
  namespace: rbac-namespace
subjects:
- kind: Group
  name: devops-group
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: devops-role
  apiGroup: rbac.authorization.k8s.io
EOF

# Привязка роли SecOps к группе пользователей
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: secops-binding
  namespace: rbac-namespace
subjects:
- kind: Group
  name: secops-group
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: secops-role
  apiGroup: rbac.authorization.k8s.io
EOF

# Привязка роли Support к группе пользователей
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: support-binding
  namespace: rbac-namespace
subjects:
- kind: Group
  name: support-group
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: support-role
  apiGroup: rbac.authorization.k8s.io
EOF