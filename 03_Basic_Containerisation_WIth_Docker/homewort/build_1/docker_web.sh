#!/bin/bash

docker pull centos:8
docker build -t cent_os_web_server .
docker container run -d -p 8080:80 --name web_server cent_os_web_server