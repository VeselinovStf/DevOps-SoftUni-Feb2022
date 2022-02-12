# Notes for Practice M2: Introduction to Docker

1. vagrant init --minimal shekeriev/centos-stream-8
2. vagrant ssh
    - CentOs

FROM centos:8

# fix for CENT OS 8

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* &&\
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
    
RUN sudo dnf update -y \
    sudo dnf install httpd -y \

# systemctl is missing from image
# systemctl files -> /usr/lib/systemd/system/

# CENTOS 8
# docker service -> ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock.
# docker service -> ExecReload=/bin/kill -s HUP $MAINPID

# apache service ->  ExecStart=/usr/sbin/httpd $OPTIONS -DFOREGROUND
# appache reload -> ExecReload=/usr/sbin/httpd $OPTIONS -k graceful

    sudo systemctl enable httpd \
    sudo systemctl restart httpd \

# firewall is missing from image

    sudo firewall-cmd --permanent --add-service=http \
    sudo firewall-cmd --reload \

    sudo setsebool -P httpd_can_network_connect=1 

COPY web/ /var/www/html
EXPOSE 80
