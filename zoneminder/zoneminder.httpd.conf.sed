# Use mod_mpm_prefork instead of mod_mpm_event.so because libphp5.so included with
# php-apache does not work with mod_mpm_event (FS#39218).
s|^LoadModule mpm_event_module modules/mod_mpm_event.so$|#&\nLoadModule mpm_prefork_module modules/mod_mpm_prefork.so|;

# Zoneminder requires cgi
\|^#LoadModule cgi_module modules/mod_cgi.so$| s|#||;

\|^LoadModule php5_module modules/libphp5.so|d;
s|^#*LoadModule rewrite_module modules/mod_rewrite.so$|&\nLoadModule php5_module modules/libphp5.so|;
\|^# PHP 5|d;
\|^Include /etc/httpd/conf/extra/php5_module.conf|d;
\|^# ZoneMinder|d;
\|^Include /etc/httpd/conf/extra/httpd-zoneminder.conf|d;
s|^Include conf/extra/httpd-default.conf|&\n# PHP 5 zoneminder.install.post_install\nInclude /etc/httpd/conf/extra/php5_module.conf\n# ZoneMinder zoneminder.install.post_install\nInclude /etc/httpd/conf/extra/httpd-zoneminder.conf|;
