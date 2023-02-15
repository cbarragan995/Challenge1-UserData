#!/bin/bash


sudo amazon-linux-extras install epel -y 
sudo yum install https://dev.mysql.com/get/mysql80-community-release-el7-5.noarch.rpm
sudo yum -y install mysql-community-server
sudo systemctl active mysqld 
sudo systemctl start mysqld
sudo mysql -u root -e "create user 'cbarragan'@'%' identified by '123abc'; GRANT ALL PRIVILEGES ON *.* TO 'cbarragan'@'%' WITH GRANT OPTION;"
sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql
sudo systemctl is-enabled mysql.service
