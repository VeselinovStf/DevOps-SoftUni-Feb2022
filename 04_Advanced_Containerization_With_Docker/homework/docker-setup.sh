#!/bin/bash

echo "* Add Docker repository ..."
dnf -y install dnf-plugins-core
dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

echo "* Install Docker ..."
dnf -y install docker-ce docker-ce-cli containerd.io

echo "* Enable and start Docker ..."
systemctl enable docker
systemctl start docker

echo "* Add vagrant user to docker group ..."
usermod -aG docker vagrant

