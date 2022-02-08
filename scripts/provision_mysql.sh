#!/bin/bash

echo "MySql provisioning - begin"

#installare mysql-server

sudo apt-get install mysql-server -y

#abilitare le connessioni da altri server

echo "Updating bind address"

sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

#riavviare mysql in modo da applicare le modifiche

echo "Restarting mysql service"

sudo service mysql restart

echo "MySql provisioning - end"



echo "Setup mysql database - start"



DBNAME=vagrant

DBUSER=vagrant

DBPASSWD=vagrantpass

echo "Creating new db $DBNAME"

sudo mysql -u root -e "CREATE DATABASE $DBNAME"

sudo mysql -u root -e "CREATE USER '$DBUSER'@'%' IDENTIFIED BY '$DBPASSWD';"

sudo mysql -u root -e "GRANT ALL PRIVILEGES ON $DBNAME.* TO '$DBUSER'@'%' WITH GRANT OPTION;"



echo "Setup mysql database - end"	