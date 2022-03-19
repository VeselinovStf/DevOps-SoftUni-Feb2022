FROM centos:8

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* &&\
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*

RUN dnf -y update && \
    dnf install httpd -y

EXPOSE 80

COPY html/ /var/www/html

ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
