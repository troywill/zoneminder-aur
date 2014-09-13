#!/usr/bin/bash

mysqladmin --defaults-file=/etc/mysql/my.cnf -p -f reload
cat /usr/share/zoneminder/db/zm_create.sql | mysql --defaults-file=/etc/mysql/my.cnf -p
echo 'grant lock tables, alter,select,insert,update,delete on zm.* to 'zmuser'@localhost identified by "zmpass";' | mysql --defaults-file=/mysqladmin --defaults-file=/etc/mysql/my.cnf -p -f reload
