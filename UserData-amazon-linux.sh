#!/bin/bash

sudo yum -y update
sudo amazon-linux-extras install epel -y 
sudo yum -y install https://dev.mysql.com/get/mysql80-community-release-el7-5.noarch.rpm
sudo yum -y install aspell aspell-en httpd24 mysql mysql-server php56 php56-cli php56-gd php56-intl php56-mbstring php56-mysqlnd php56-opcache php56-pdo php56-soap php56-xml php56-xmlrpc php56-pspell --skip-broken
sudo yum -y install mysql-community-server 
sudo systemctl enable mysqld
sudo systemctl start mysqld
pass2=$(sudo cat /var/log/mysqld.log | grep "A temporary password" | awk '{ print $13 }')
mysql -u root -p$pass2 -e "create user 'cbarragan35'@'%' identified by '2(f*Z+uNvOQ,as'; GRANT ALL PRIVILEGES ON *.* TO 'cbarragan35'@'%' WITH GRANT 
OPTION;"
