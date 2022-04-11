#!/bin/bash

echo "* Install Java"
sudo apt-get install -y openjdk-11-jre

echo "* Set-Up Jenkins agent"
sudo useradd jenkins

echo "* Add Passwd to Jenkins"
echo -e "Password1\nPassword1" | sudo passwd jenkins

echo "* Add Jenkins - Docker group"
echo 'jenkins ALL=(ALL)    NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

sudo mkhomedir_helper jenkins

sudo usermod -aG docker jenkins
sudo usermod -aG vagrant jenkins

