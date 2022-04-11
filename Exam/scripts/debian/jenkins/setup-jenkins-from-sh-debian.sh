#!/bin/bash

echo "***** Disable Security"
sudo cp /vagrant/config/jenkins/disable-jenkins-security.xml /var/lib/jenkins/config.xml

echo "***** Skipping the initial setup"
echo 'JAVA_ARGS="-Djenkins.install.runSetupWizard=false"' | sudo tee -a /etc/default/jenkins

sudo mkdir /var/lib/jenkins/init.groovy.d
sudo cp -v /vagrant/config/jenkins/basic-security.groovy /var/lib/jenkins/init.groovy.d/basic-security.groovy

echo "***** Setting up users"
sudo cp -v /vagrant/config/jenkins/01_globalMatrixAuthorizationStrategy.groovy /var/lib/jenkins/init.groovy.d/
sudo cp -v /vagrant/config/jenkins/02_createAdminUser.groovy /var/lib/jenkins/init.groovy.d/

echo "***** Start Jenkins"
sudo systemctl start jenkins

# echo "***** Rest a 30s"
# sleep 30s

echo "***** Disable Security"
sudo cp /vagrant/config/jenkins/disable-jenkins-security.xml /var/lib/jenkins/config.xml

echo "***** Restart Jenkins"
sudo systemctl restart jenkins

# hm take this part to separate script executed by root/vagrant
echo "***** Instaling Jenkins Plugins"
sudo wget -q http://localhost:8080/jnlpJars/jenkins-cli.jar
while IFS= read -r line
do
  list=$list' '$line
done < /vagrant/config/jenkins/jenkins_plugins.txt
java -jar ./jenkins-cli.jar -s http://localhost:8080 install-plugin $list

echo "* Restart Jenkins *"
sudo systemctl restart jenkins

echo "****** Jenkins Credentials: admin/admin ******"