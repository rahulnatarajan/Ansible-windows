#!/bin/sh

dbuser=$1
dbpassword=$2
dbhost=$3
dbname=$4


sudo sed -i -e "151s/None/All/" /etc/httpd/conf/httpd.conf
sudo sed -i -e "s/dbuser/$dbuser/g" /var/www/html/wp-config.php
sudo sed -i -e "s/dbpassword/$dbpassword/g" /var/www/html/wp-config.php
sudo sed -i -e "s/localhost/$dbhost/g" /var/www/html/wp-config.php
sudo sed -i -e "s/dbname/$dbname/g" /var/www/html/wp-config.php
