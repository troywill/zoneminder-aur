#!/bin/bash

set -o nounset

REMOVE='sudo pacman --remove'
RVF='sudo rm -rvf'

ZONEMINDER_CACHE_DIR=/var/cache/zoneminder

sudo systemctl stop zoneminder
sudo systemctl stop httpd
sudo systemctl stop mysqld

$REMOVE zoneminder
$REMOVE zoneminder-git
sudo rm -rvf $ZONEMINDER_CACHE_DIR
sudo rm -rvf /var/log/zoneminder

$REMOVE php-cgi
$REMOVE php-gd
$REMOVE php-mcrypt
$REMOVE php-apache
$REMOVE php
$RVF /etc/php

$REMOVE apache
$RVF /etc/httpd
$RVF /var/log/httpd

$REMOVE mariadb
$REMOVE mariadb-clients
$RVF /var/lib/mysql/
