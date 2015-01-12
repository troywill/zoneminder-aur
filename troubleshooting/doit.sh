#!/bin/bash

set -o verbose
set -o errexit

tar -cvf v1.28.0.tar ZoneMinder-1.28.0/
gzip v1.28.0.tar
makepkg -f --skipinteg
sudo pacman --upgrade ./zoneminder-1.28.0-4-i686.pkg.tar.xz
sudo systemctl restart zoneminder
