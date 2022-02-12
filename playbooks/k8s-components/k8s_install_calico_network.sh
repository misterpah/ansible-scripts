#!/bin/bash

kubectl create -f https://projectcalico.docs.tigera.io/manifests/tigera-operator.yaml

wget https://projectcalico.docs.tigera.io/manifests/custom-resources.yaml
cat custom-resources.yaml | sed  "s|192.168.0.0/16|10.0.0.0/16|" > custom-resources.edit.yaml
kubectl apply -f custom-resources.edit.yaml
kubectl taint nodes --all node-role.kubernetes.io/master-

rm custom-resources.yaml
rm custom-resources.edit.yaml