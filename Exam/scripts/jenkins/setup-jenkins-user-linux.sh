#!/bin/bash

echo "**** Stop Jenkins"
sudo systemctl stop jenkins

echo "* Set-Up Jenkins USER if not"
sudo useradd jenkins

echo "* Add Passwd to Jenkins"
echo -e "Password1\nPassword1" | sudo passwd jenkins

echo "* Add Jenkins - Docker group"
echo 'jenkins ALL=(ALL)    NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

echo "* Final Fixes for Jenkins"
sudo mkhomedir_helper jenkins
sudo usermod -aG vagrant jenkins