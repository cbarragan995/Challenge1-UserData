#!/bin/bash


sudo apt update
sudo apt install mysql-server -y
sudo systemctl enable mysql.service
sudo systemctl status mysql.service
sudo systemctl start mysql.service
sudo mysql -u root -e "create user 'cbarragan'@'%' identified by '123abc'; GRANT ALL PRIVILEGES ON *.* TO 'cbarragan'@'%' WITH GRANT OPTION;"
sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql
sudo systemctl is-enabled mysql.service
