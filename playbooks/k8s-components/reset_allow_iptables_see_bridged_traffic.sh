#!/bin/bash
sudo rm /etc/modules-load.d/k8s.conf
sudo rm /etc/sysctl.d/k8s.conf
sudo sysctl --system