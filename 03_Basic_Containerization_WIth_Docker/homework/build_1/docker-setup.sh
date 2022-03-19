#!/bin/bash

echo "* Add hosts ..."
echo "192.168.99.100 docker.do1.lab docker" >> /etc/hosts

echo "* Add Docker repository ..."
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo "* Install Docker ..."
sudo dnf install -y docker-ce docker-ce-cli containerd.io

echo "* Enable and start Docker ..."
sudo systemctl enable docker
sudo systemctl start docker

echo "* Firewall - open port 8080 ..."
sudo sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload

echo "* Add vagrant user to docker group ..."
sudo usermod -aG docker vagrant
