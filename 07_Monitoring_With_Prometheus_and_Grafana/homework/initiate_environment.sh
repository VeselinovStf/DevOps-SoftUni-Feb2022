#!/bin/bash

echo "** Configure Docker"
cp /vagrant/src/docker/daemon.json /etc/docker/daemon.json

echo "** Restart Service"
systemctl restart docker

echo "** Run Docker Compose"
cd /vagrant/src && docker-compose up -d --build