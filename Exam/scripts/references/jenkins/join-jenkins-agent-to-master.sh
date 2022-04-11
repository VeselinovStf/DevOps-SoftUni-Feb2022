#!/bin/bash

echo "**** Create SSH Connection with agent"
sudo sshpass -p Password1 ssh-copy-id -o StrictHostKeyChecking=no -i /var/lib/jenkins/.ssh/id_rsa jenkins@containers.do1.exam

echo "**** Add to Jenkins known host"
ssh-keyscan containers.do1.exam >> known_hosts
sudo -u jenkins cp known_hosts /var/lib/jenkins/.ssh/known_hosts

echo "**** Create agent"
java -jar jenkins-cli.jar  -auth admin:admin -s http://localhost:8080 create-node docker-node < /vagrant/scripts/references/jenkins/create-jenkins-node.sh