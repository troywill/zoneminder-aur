# Enable these libraries by removing the leading comment character
\|^;extension=mysql.so$| s|^;||;
\|^;extension=mysqli.so$| s|^;||;
\|^;extension=gd.so$| s|^;||;
\|^;extension=gettext.so$| s|^;||;
\|^;extension=mcrypt.so$| s|^;||;
\|^;extension=session.so$| s|^;||;
\|^;extension=sockets.so$| s|^;||;
\|^;extension=openssl.so$| s|^;||;
\|^;extension=ftp.so$| s|^;||;
\|^;extension=zip.so$| s|^;||;

# Add zoneminder paths to open_basedir
s|^open_basedir = /srv/http/:/home/:/tmp/:/usr/share/pear/:/usr/share/webapps/$|&:/etc:/srv/http/zoneminder/:/var/cache/zoneminder/|;
