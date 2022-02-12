echo "* Add hosts ..."
echo "192.168.89.100 web.do1.lab web" >> /etc/hosts
echo "192.168.89.101 db.do1.lab db" >> /etc/hosts

echo "* Install Software ..."
sudo apt upgrade -y
sudo apt install -y mariadb-server

echo "Bind mysql to 0.0.0.0"
sed -i "s/bind-address.*/bind-address            = 0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

echo "* Start HTTP ..."
sudo systemctl enable mariadb
sudo systemctl restart mariadb

echo "* Create and load the database ..."
mysql -u root < /vagrant/db_setup.sql