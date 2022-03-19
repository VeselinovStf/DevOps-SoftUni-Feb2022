#!/bin/bash

echo "* Initializing SWARM MASTER"
docker swarm init --advertise-addr $1

echo "* Creating Coppy of join token to shared folder"
echo $(docker swarm join-token -q worker) > /vagrant/token.txt

# Uncoment if settup of web image is from volume
# echo "* Cloning Project"
# git clone https://github.com/VeselinovStf/DevOps-SoftUni-Feb2022_Exercise.git

echo "* Adding Docker-Compose"
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
