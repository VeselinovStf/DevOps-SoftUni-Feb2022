# Jenkins

echo -e "Password1\nPassword1" | sudo passwd jenkins

-------------
wget http://192.168.99.100:8080/jnlpJars/jenkins-cli.jar
java -jar jenkins-cli.jar -s http://localhost:8080/ -ssh -user admin version 

# Docker - Slave

echo "* Install Java"
sudo apt-get -y install fontconfig openjdk-11-jre

echo "Setup Jenkins User"
sudo useradd -m -p $(echo Password1 | openssl passwd -1 -stdin) -s /bin/bash jenkins
echo 'jenkins ALL=(ALL)    NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo
sudo usermod -aG docker jenkins

echo "* Adding Docker-Compose"
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

echo "* Doker-Compose - Starting Gitea"
sudo docker-compose -f /home/vagrant/docker-compose.yml up -d


# Homework 

vagrant up
install jenkins in jenkins.do1.lab
install gitea in docker.do1.lab

- create repository - shared/bgapp
- add gitea plugin
- add gitea credidentials
- run jenkins cli command for new job
- DONE