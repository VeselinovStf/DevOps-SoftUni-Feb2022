# Lab Notes

1. Install 

wget https://github.com/prometheus/prometheus/releases/download/v2.33.5/prometheus-2.33.5.linux-amd64.tar.gz
tar xzvf prometheus-2.33.5.linux-amd64.tar.gz
cd prometheus-2.33.5.linux-amd64

./promtool check config prometheus.yml
./prometheus --config.file prometheus.yml --web.enable-lifecycle 2>> /tmp/prometheous.log &

curl -X POST http://192.168.99.101:9090/-/reload

application.json
[
        {
                "targets" : ["node2:8081"],
                "labels": {
                        "role" : "container"
                }
        },
        {
                "targets" : ["node3:8081"],
                "labels": {
                        "role" : "appThree"
                }
        },
        {
                "targets" : ["node2:8082"],
                "labels": {
                        "role" : "container-secondary"
                }
        },
        {
                "targets" : ["node3:8082"],
                "labels": {
                        "role" : "container-secondary"
                }
        }
]

2. Node exporter

wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz 
tar xzvf node_exporter-1.3.1.linux-amd64.tar.gz
cd node_exporter-1.3.1.linux-amd64/
./node_exporter 2> /tmp/prometheus_node_exporter.log &

3. Alert Manager

wget https://github.com/prometheus/alertmanager/releases/download/v0.23.0/alertmanager-0.23.0.linux-amd64.tar.gz
tar xzvf alertmanager-0.23.0.linux-amd64.tar.gz
cd alertmanager-0.23.0.linux-amd64/
./alertmanager &> /tmp/am.log &

4. Grafana

docker volume create grafana
docker run -d -p 3000:3000 --name grafana --rm -v grafana:/var/lib/grafana grafana/grafana-oss

http://192.168.99.101:3000/login 
admin / admin
