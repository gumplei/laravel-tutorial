#/bin/bash

MYSQL_CID=`docker-compose ps -q mysql`
MYSQL_IP=`docker inspect --format "{{ .NetworkSettings.IPAddress }}" ${MYSQL_CID}`

echo "MySQL IP: " ${MYSQL_IP}

echo "Create Database"
mysql -h ${MYSQL_IP} -u root -proot -e "create database homestead;"
echo "Create user"
mysql -h ${MYSQL_IP} -u root -proot -e "create user 'homestead'@'%' identified by 'secret';"
echo "Grant database premission"
mysql -h ${MYSQL_IP} -u root -proot -e "grant all on homestead.* to 'homestead'@'%';"
