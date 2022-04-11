#!/bin/bash

echo "** Configure Docker"
cp /vagrant/config/docker/daemon.json /etc/docker/daemon.json

echo "** Restart Service"
systemctl restart docker