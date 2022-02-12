echo "* Add hosts ..."
echo "192.168.89.100 web.do1.lab web" >> /etc/hosts
echo "192.168.89.101 db.do1.lab db" >> /etc/hosts

echo "* Install Software ..."
sudo apt upgrade -y
sudo apt install -y apache2 php php-mysqlnd git

echo "* Start HTTP ..."
sudo systemctl enable apache2
sudo systemctl restart apache2

echo "* Copy web site files to /var/www/html/ ..."
cp /vagrant/* /var/www/html