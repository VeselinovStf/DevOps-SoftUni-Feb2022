#!/bin/bash

echo "* Create Kibana index"
curl -X POST http://192.168.99.101:5601/api/index_patterns/index_pattern -H 'kbn-xsrf: true' -H 'Content-Type: application/json' -d '
{
  "index_pattern": {
     "title": "metricbeat*"
  }
}'