#!/bin/bash

set -o verbose
set -o nounset

MYSQL_USER=root

sudo systemctl stop zoneminder
sudo systemctl stop httpd

sudo rm -rv /var/lib/zoneminder/temp/*
sudo rm -v /var/lib/zoneminder/sock/*

echo 'DELETE FROM Logs;' | mysql --user $MYSQL_USER zm

sudo systemctl start zoneminder
