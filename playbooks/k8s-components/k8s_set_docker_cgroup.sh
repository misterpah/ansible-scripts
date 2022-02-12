#!/bin/bash

WRITE_DOCKER_DAEMON="false"
DOCKER_DAEMON_CONTENT="{}"

if [ -f /etc/docker/daemon.json ]; then
    # file exist. checking if content is available
    DOCKER_DAEMON_CONTENT=$(cat /etc/docker/daemon.json)
    WRITE_DOCKER_DAEMON="true"
else
    #file not exist
    WRITE_DOCKER_DAEMON="true"
fi


if [ $WRITE_DOCKER_DAEMON == "true" ]; then
echo $DOCKER_DAEMON_CONTENT | jq '. + {"exec-opts":["native.cgroupdriver=systemd"], "storage-driver": "overlay2"}' | sudo tee /etc/docker/daemon.json > /dev/null
fi
