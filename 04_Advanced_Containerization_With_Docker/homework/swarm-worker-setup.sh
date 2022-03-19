#!/bin/bash

# Uncoment if settup of web image is from volume
# echo "* Cloning Project"
# git clone https://github.com/VeselinovStf/DevOps-SoftUni-Feb2022_Exercise.git

echo "* Joining As a Worker - take join-token from shared folder"
docker swarm join --token $(cat /vagrant/token.txt) --advertise-addr $1 192.168.99.101:2377

