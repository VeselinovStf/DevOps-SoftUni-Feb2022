#!/bin/bash

echo "* Install Elastic Search"
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
sudo cp /vagrant/config/elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo
sudo dnf install -y --enablerepo=elasticsearch elasticsearch

sudo cp /vagrant/config/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
sudo cp /vagrant/config/server.options /etc/elasticsearch/jvm.options.d/server.options

sudo systemctl daemon-reload
sudo systemctl enable --now elasticsearch
sudo systemctl start elasticsearch

echo "* Install Logstash"
sudo dnf install -y --enablerepo=elasticsearch logstash

sudo cp /vagrant/config/beats.conf /etc/logstash/conf.d/beats.conf

sudo systemctl daemon-reload
sudo systemctl enable --now logstash
sudo systemctl start logstash

echo "* Install Kibana"
sudo dnf install -y --enablerepo=elasticsearch kibana

sudo cp /vagrant/config/kibana.yml /etc/kibana/kibana.yml

sudo systemctl daemon-reload
sudo systemctl enable --now kibana
sudo systemctl start kibana

echo "* Enable Ports"
sudo firewall-cmd --add-port 5601/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --add-port 9200/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --add-port 5044/tcp --permanent
sudo firewall-cmd --reload 

