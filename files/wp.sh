#!/bin/bash
sudo yum update -y
sudo yum install -y httpd24 php70 mysql php70-mysqlnd
sudo service httpd start
sudo chkconfig httpd on
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
aws s3 cp s3://scbdemo/wordpress/ wordpress/ --recursive
sudo cp -r wordpress/* /var/www/html/
sudo chown -R apache /var/www
sudo chgrp -R apache /var/www
sudo chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;
sudo service httpd restart
