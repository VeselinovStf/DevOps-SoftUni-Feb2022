#!/bin/bash

echo "* Download Prometheus"
wget https://github.com/prometheus/prometheus/releases/download/v2.33.5/prometheus-2.33.5.linux-amd64.tar.gz
tar xzvf prometheus-2.33.5.linux-amd64.tar.gz

echo "* Add Prometheus Configuration"
sudo cp  /vagrant/config/prometheus/prometheus.yml /home/vagrant/prometheus-2.33.5.linux-amd64/prometheus.yml

echo "* Start Prometheus"
cd prometheus-2.33.5.linux-amd64 && sudo ./prometheus --config.file prometheus.yml --web.enable-lifecycle 2>> /tmp/prometheus.log &

