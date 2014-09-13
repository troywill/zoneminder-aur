#!/bin/bash

# script to download Zoneminder dependency build tarballs from AUR
mkdir --parent aur && cd aur
wget https://aur.archlinux.org/packages/ca/cambozola/cambozola.tar.gz
wget https://aur.archlinux.org/packages/pe/perl-astro-suntime/perl-astro-suntime.tar.gz
wget https://aur.archlinux.org/packages/pe/perl-expect/perl-expect.tar.gz
wget https://aur.archlinux.org/packages/pe/perl-net-sftp-foreign/perl-net-sftp-foreign.tar.gz
wget https://aur.archlinux.org/packages/pe/perl-php-serialization/perl-php-serialization.tar.gz
wget https://aur.archlinux.org/packages/pe/perl-sys-mmap/perl-sys-mmap.tar.gz
wget https://aur.archlinux.org/packages/pe/perl-x10/perl-x10.tar.gz
