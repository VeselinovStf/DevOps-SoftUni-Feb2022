#!/bin/bash

echo "* Install Metric Beat"
curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-8.1.0-amd64.deb
sudo dpkg -i metricbeat-8.1.0-amd64.deb

echo "* Add Configuration"
sudo cp /vagrant/config/metricbeat.yml /etc/metricbeat/metricbeat.yml

echo "* Enable Module"
sudo metricbeat modules enable system

echo "* Start/Reload Service"
sudo systemctl daemon-reload
sudo systemctl enable metricbeat
sudo systemctl start metricbeat

echo "* Set up Elastic"
sudo metricbeat setup --index-management -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["http://192.168.99.101:9200"]'
