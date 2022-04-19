# Steps

- vagrant up
- go to  http://192.168.150.102:3000/
- login chofexx/password
- create new migration from GitHub
- add Webhook
- Target URL: http://192.168.150.101:8080/gitea-webhook/post

## vm102

- git clone http://192.168.150.102:3000/chofexx/dob-2021-04-exam-re.git
- cd dob-2021-04-exam-re/
- cp /vagrant/src/app/docker-compose.Production.yml docker-compose.Production.yml
- cp /vagrant/src/app/docker-compose.Development.yml docker-compose.Development.yml
- cp /vagrant/src/app/Jenkinsfile Jenkinsfile
- git add *
- git commit -m "Adding CI/CD"
- git push
        Username for 'http://192.168.150.102:3000': chofexx
        Password for 'http://chofexx@192.168.150.102:3000': password

## vm101

- Start - Build job - Initial job build
- make change in project repo - push
- check if Jenkins is building the job

## vm103

- check prometheus targets - http://192.168.150.103:9090/targets
- Setup Grafana
    - login admin/admin
    - change password
    - add dashboard

