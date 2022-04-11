#!/bin/bash

echo "* Add The Job"
java -jar jenkins-cli.jar  -auth admin:admin -s http://localhost:8080 create-job ExamPipeline-Pipeline < /vagrant/src/jenkins/the_job.xml