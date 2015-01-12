cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DZM_CGIDIR=/srv/http/cgi-bin \
      -DZM_WEBDIR=/srv/http/ \
      -DZM_WEB_USER=http \
      -DZM_CONTENTDIR=/var/cache/zoneminder \
      -DZM_LOGDIR=/srv/zoneminder/log \
      -DZM_RUNDIR=/srv/zoneminder/run \
      -DZM_TMPDIR=/srv/zoneminder/tmp \
      -DZM_SOCKDIR=/srv/zoneminder/socks .

make V=0
