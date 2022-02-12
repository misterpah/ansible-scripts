#!/bin/bash

WRITE_BR_NETFILTER="false"

if [ -f /etc/modules-load.d/k8s.conf ]; then
    # file exist. checing if content is available
    
    cat /etc/modules-load.d/k8s.conf | grep br_netfilter
    if [ $? == 1 ];then
        # there is no br_netfilter in file
        WRITE_BR_NETFILTER="true"
    fi
else
    # file not exist
    WRITE_BR_NETFILTER="true"
fi

if [ $WRITE_BR_NETFILTER == "true" ]; then
# write br_netfilter into file
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF
fi

#------------------------------------

WRITE_BRIDGE_NF_CALL_IPTABLES="false"


if [ -f /etc/sysctl.d/k8s.conf ]; then
    # file exist. checing if content is available
    
    cat /etc/sysctl.d/k8s.conf| grep net.bridge.bridge-nf-call-ip6tables
    if [ $? == 1 ];then
        # there is no br_netfilter in file
        WRITE_BRIDGE_NF_CALL_IPTABLES="true"
    fi
else
    # file not exist
    WRITE_BRIDGE_NF_CALL_IPTABLES="true"
fi


if [ $WRITE_BRIDGE_NF_CALL_IPTABLES == "true" ]; then
# write bridge_nf_call_iptables into file
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
fi

sudo sysctl --system