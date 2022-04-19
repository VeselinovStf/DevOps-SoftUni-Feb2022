# NOTES

# Server vm

- sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
- sudo cp elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo
- sudo dnf install -y --enablerepo=elasticsearch elasticsearch
- sudo vi /etc/elasticsearch/elasticsearch.yml
- sudo nano /etc/elasticsearch/jvm.options.d/server.options

## -Xms4g
## -Xmx4g

- sudo /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic
- SqXbpgew=c7q2nA+T57T
- journalctl --unit elasticsearch
- journalctl --unit elasticsearch --since "2022-03-17 18:17:16"
- curl -k -u elastic https://localhost:9200

## sudo firewall-cmd --add-port 9200/tcp --permanent
## sudo firewall-cmd --reload

- [vagrant@server ~]$ export EUSR='elastic'
- [vagrant@server ~]$ export EPWD='SqXbpgew=c7q2nA+T57T'
- [vagrant@server ~]$ curl -k -XGET -u "${EUSR}:${EPWD}" https://localhost:9200/_cat/health?v

## Logstash

sudo dnf install -y --enablerepo=elasticsearch logstash
sudo systemctl daemon-reload
sudo systemctl enable --now logstash
sudo systemctl start logstash

## Kibana

sudo dnf install -y --enablerepo=elasticsearch kibana
sudo vi /etc/kibana/kibana.yml
sudo systemctl daemon-reload
sudo systemctl enable --now kibana
sudo firewall-cmd --add-port 5601/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --add-port 9200/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --add-port 5044/tcp --permanent
sudo firewall-cmd --reload 

## BEATS
### SERVER
#### BEATS

sudo dnf install -y wget

wget https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-8.1.0-x86_64.rpm

sudo rpm -Uvh heartbeat-8.1.0-x86_64.rpm

/etc/heartbeat/heartbeat.yml

sudo heartbeat setup --index-management -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["localhost:9200"]'

###### Logstash Beat - setup

sudo vi /etc/logstash/conf.d/beats.conf


sudo systemctl restart logstash
sudo systemctl daemon-reload
sudo systemctl enable heartbeat-elastic
sudo systemctl start heartbeat-elastic

### NODE 1 - centos-stream-8

#### Metricbeat 


wget https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-8.1.0-x86_64.rpm
sudo rpm -Uvh metricbeat-8.1.0-x86_64.rpm

sudo vi /etc/metricbeat/metricbeat.yml

sudo metricbeat modules enable system

sudo metricbeat setup --index-management -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["192.168.99.101:9200"]'

sudo systemctl daemon-reload
sudo systemctl enable metricbeat
sudo systemctl start metricbeat

#### Auditbeat

wget https://artifacts.elastic.co/downloads/beats/auditbeat/auditbeat-8.1.0-x86_64.rpm
sudo rpm -Uvh auditbeat-8.1.0-x86_64.rpm

sudo auditbeat setup --index-management -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["192.168.99.101:9200"]'

sudo systemctl daemon-reload
sudo systemctl enable auditbeat
sudo systemctl start auditbeat


#### Filebeat

wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.1.0-x86_64.rpm
sudo rpm -Uvh filebeat-8.1.0-x86_64.rpm

sudo vi /etc/filebeat/filebeat.yml

sudo filebeat modules enable system

sudo filebeat setup --index-management -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["192.168.99.101:9200"]'

sudo systemctl daemon-reload
sudo systemctl enable filebeat
sudo systemctl start filebeat


### NODE 2 - debian

#### Metricbeat 

wget https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-8.1.0-amd64.deb
sudo dpkg -i metricbeat-8.1.0-amd64.deb

sudo vi /etc/auditbeat/auditbeat.yml


#### Auditbeat

wget https://artifacts.elastic.co/downloads/beats/auditbeat/auditbeat-8.1.0-amd64.deb
sudo dpkg -i auditbeat-8.1.0-amd64.deb

sudo vi /etc/auditbeat/auditbeat.yml

sudo auditbeat setup --index-management -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["192.168.99.101:9200"]'

sudo systemctl daemon-reload
sudo systemctl enable auditbeat
sudo systemctl start auditbeat

#### Filebeat

wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.1.0-amd64.deb
sudo dpkg -i filebeat-8.1.0-amd64.deb

sudo vi /etc/filebeat/filebeat.yml

sudo filebeat modules enable system


curl -X POST http://192.168.99.101:5601/api/index_patterns/index_pattern -H 'kbn-xsrf: true' -H 'Content-Type: application/json' -d '
{
  "index_pattern": {
     "title": "metricbeat*"
  }
}'