#!/bin/bash

echo "* Generate Jenkins SSH"
sudo -u jenkins -S ssh-keygen -q -f /var/lib/jenkins/.ssh/id_rsa -N '' -t rsa -m PEM

echo "* Add SSH to Credentials"
keyPoint="$(sudo cat /var/lib/jenkins/.ssh/id_rsa)"
xmlstarlet edit --inplace --update '//privateKey' --value "$keyPoint" /vagrant/config/jenkins/credentials/jenkins_ssh_credentials.xml

echo "***** Rest a 1m for Jenkins recovery"
sleep 1m

# echo "* SetUp Jenkins User"
# sudo usermod -s /bin/bash jenkins
# echo -e "Password1\nPassword1" | sudo passwd jenkins

echo "* Adding Jenkins credentials"
java -jar jenkins-cli.jar  -auth admin:admin -s http://localhost:8080 create-credentials-by-xml system::system::jenkins _ < /vagrant/config/jenkins/credentials/gitea_credentials.xml
java -jar jenkins-cli.jar  -auth admin:admin -s http://localhost:8080 create-credentials-by-xml system::system::jenkins _ < /vagrant/config/jenkins/credentials/docker_hub_credentials.xml
java -jar jenkins-cli.jar  -auth admin:admin -s http://localhost:8080 create-credentials-by-xml system::system::jenkins _ < /vagrant/config/jenkins/credentials/jenkins_ssh_credentials.xml
