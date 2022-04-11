#!/bin/bash

echo "* Doker-Compose - Starting Gitea *"
sudo docker-compose -f /vagrant/src/gitea/docker-compose-gitea.yml up -d

echo "* Add Gitea Configuration *"
sudo docker cp /vagrant/config/gitea/app.ini gitea:/data/gitea/conf

echo "* Reset Gitea Container *"
sudo docker stop gitea
sudo docker start gitea

#echo "* Doker-Compose - Create Gitea User *"
#sudo docker exec -d gitea su -c "gitea admin user create --admin --username chofexx --password password --email m223232e@me.com --must-change-password=false" git