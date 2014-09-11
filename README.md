<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Introduction</a></li>
<li><a href="#sec-2">2. Step by step</a></li>
</ul>
</div>
</div>

# Introduction<a id="sec-1" name="sec-1"></a>

# Step by step<a id="sec-2" name="sec-2"></a>

1.  [ ] Install AUR dependencies
    Here's a helper script to download the PKGBUILDS from the AUR:
    
        # script to download Zoneminder dependency build tarballs from AUR
        mkdir --parent aur && cd aur
        wget https://aur.archlinux.org/packages/ca/cambozola/cambozola.tar.gz
        wget https://aur.archlinux.org/packages/pe/perl-astro-suntime/perl-astro-suntime.tar.gz
        wget https://aur.archlinux.org/packages/pe/perl-expect/perl-expect.tar.gz
        wget https://aur.archlinux.org/packages/pe/perl-net-sftp-foreign/perl-net-sftp-foreign.tar.gz
        wget https://aur.archlinux.org/packages/pe/perl-php-serialization/perl-php-serialization.tar.gz
        wget https://aur.archlinux.org/packages/pe/perl-sys-mmap/perl-sys-mmap.tar.gz
        wget https://aur.archlinux.org/packages/pe/perl-x10/perl-x10.tar.gz
2.  [ ] Build zoneminder package but don't install it
    
        cp -a zoneminder zoneminder-build
        cd zoneminder-build
        makepkg -s
3.  [ ] Copy config files
    
        set -o errexit
        set -o verbose
        cd ../config
        cp -i /etc/php/php.ini php.ini.pre.zoneminder.install
        cp -i /etc/httpd/conf/httpd.conf httpd.conf.pre.zoneminder.install
4.  [ ] Install zoneminder
    
        pacman --upgrade zoneminder-1.27.0-2-i686.pkg.tar.xz
5.  [ ] Copy config files
    
        set -o errexit
        set -o verbose
        cd ../config
        cp -i /etc/php/php.ini php.ini.post.zoneminder.install
        cp -i /etc/httpd/conf/httpd.conf httpd.conf.post.zoneminder.install
6.  [ ] Configure /etc/httpd/conf/httpd.conf for PHP
    1.  [ ] Read primary documentation <https://wiki.archlinux.org/index.php/Apache_HTTP_Server#PHP>
    2.  [ ] To use mod<sub>mpm</sub><sub>prefork</sub>, open <file:///etc/httpd/conf/httpd.conf> and replace
        
            LoadModule mpm_event_module modules/mod_mpm_event.so
        
        with
        
            LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
    3.  [ ] add these lines to <file:///etc/httpd/conf/httpd.conf>:
        1.  [ ] Place this in the LoadModule list anywhere after LoadModule dir<sub>module</sub> modules/mod<sub>dir</sub>.so:
            (Note: zoneminder.install attemps to do this but fails)
            
                LoadModule php5_module modules/libphp5.so
        2.  [ ] Place this at the end of the Include list: (Note: zoneminder.install did this)
            
                Include conf/extra/php5_module.conf
7.  [ ] Mysql (see zoneminder.install)
    1.  [ ] Start httpd server
        
            systemctl restart httpd
    2.  [ ] Start mysql server
        
            systemctl restart mysqld
    3.  [ ] add Zoneminder database
        1.  [ ] typing (with passsword):
            
                mysqladmin --defaults-file=/etc/mysql/my.cnf -p -f reload
                cat /usr/share/zoneminder/db/zm_create.sql | mysql --defaults-file=/etc/mysql/my.cnf -p
                echo 'grant lock tables, alter,select,insert,update,delete on zm.* to 'zmuser'@localhost identified by "zmpass";' | mysql --defaults-file=/mysqladmin --defaults-file=/etc/mysql/my.cnf -p -f reload
                
                
                cat /usr/share/zoneminder/db/zm_create.sql | mysql --defaults-file=/etc/mysql/my.cnf -p
                echo 'grant lock tables, alter,select,insert,update,delete on zm.* to 'zmuser'@localhost identified by "zmpass";' | mysql --defaults-file=/etc/mysql/my.cnf -p mysql
8.  [ ] sudo systemctl start zoneminder
9.  [ ] sudo systemctl enable zoneminder
