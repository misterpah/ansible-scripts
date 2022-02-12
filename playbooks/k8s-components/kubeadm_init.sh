#!/bin/bash

# allocate 65536 internal ip for containers
sudo kubeadm init --pod-network-cidr=10.0.0.0/16 
mkdir -p $HOME/.kube
yes | sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config