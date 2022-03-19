#!/bin/bash

echo "* Add hosts ..."
echo "192.168.99.101 docker.do1.lab docker" >> /etc/hosts

echo "* Install Software ..."
sudo apt-get -y install git fontconfig openjdk-11-jre

echo "Setup Jenkins User"
sudo useradd -m -p $(echo Password1 | openssl passwd -1 -stdin) -s /bin/bash jenkins
echo 'jenkins ALL=(ALL)    NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo
sudo usermod -aG docker jenkins