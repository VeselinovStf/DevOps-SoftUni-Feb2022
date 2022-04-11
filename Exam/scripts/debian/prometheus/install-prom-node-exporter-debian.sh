#!/bin/bash

echo "* Download Node Exporter"
wget https://github.com/prometheus/node_exporter/releases/download/v1.0.0-rc.0/node_exporter-1.0.0-rc.0.linux-amd64.tar.gz
sudo tar -xzf node_exporter-1.0.0-rc.0.linux-amd64.tar.gz

sudo useradd -rs /bin/false nodeusr
sudo mv node_exporter-1.0.0-rc.0.linux-amd64/node_exporter /usr/local/bin/
sudo cp /vagrant/src/prometheus/node_exporter.service /etc/systemd/system/node_exporter.service

echo "* Run Node Exporter"
sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter
