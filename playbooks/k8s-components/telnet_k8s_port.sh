#!/bin/bash

k8sport=6443

telnet 127.0.0.1 $k8sport
if [ $? == 1 ];then
    echo "pass.port available."
else
    echo "failed. port used"
fi
