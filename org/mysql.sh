#!/usr/bin/bash

MYSQL_USER=root
set -o verbose
set -o errexit

sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

sudo systemctl start mysqld

mysqladmin --defaults-file=/etc/mysql/my.cnf -p -f reload --user $MYSQL_USER
   
cat /usr/share/zoneminder/db/zm_create.sql | mysql --defaults-file=/etc/mysql/my.cnf --user $MYSQL_USER

echo 'grant lock tables, alter,select,insert,update,delete on zm.* to 'zmuser'@localhost identified by "zmpass";' | mysql -p --user $MYSQL_USER mysql
