#!/bin/bash

echo "* Add hosts ..."
echo "192.168.111.201 pipelines.do1.exam pipelines" >> /etc/hosts
echo "192.168.111.202 containers.do1.exam containers" >> /etc/hosts
echo "192.168.111.203 monitoring.do1.exam monitoring" >> /etc/hosts

echo "* Install Additional Packages ..."
sudo apt-get -y update
sudo apt-get install -y tree git nano curl wget sshpass xmlstarlet

