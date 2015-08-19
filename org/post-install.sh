#!/bin/bash

set -o verbose
set -o nounset

sudo cp -v /tmp/php.ini.zoneminder /etc/php/php.ini
sudo emacs /etc/php/php.ini
sudo cp -v /tmp/httpd.conf.zoneminder /etc/httpd/conf/httpd.conf

./mysql.sh

sudo systemctl start zoneminder
