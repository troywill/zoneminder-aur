# Use mod_mpm_prefork instead of mod_mpm_event.so (FS#39218).
s|^LoadModule mpm_event_module modules/mod_mpm_event.so$|#&\nLoadModule mpm_prefork_module modules/mod_mpm_prefork.so|;
# Use mod_mpm_prefork instead of mod_mpm_event.so (FS#39218).
s|^LoadModule mpm_event_module modules/mod_mpm_event.so$|#&\nLoadModule mpm_prefork_module modules/mod_mpm_prefork.so|;

# Zoneminder requires cgi
\|^#LoadModule cgi_module modules/mod_cgi.so$| s|#||;
# Zoneminder requires cgi
\|^#LoadModule cgi_module modules/mod_cgi.so$| s|#||;

# libphp5
\|^LoadModule php5_module modules/libphp5.so$|d;
s|^#*LoadModule rewrite_module modules/mod_rewrite.so$|&\nLoadModule php5_module modules/libphp5.so|;
\|^Include /etc/httpd/conf/extra/php5_module.conf|d;
s|^Include conf/extra/httpd-default.conf$|&\nInclude /etc/httpd/conf/extra/php5_module.conf|;
# libphp5
\|^LoadModule php5_module modules/libphp5.so$|d;
s|^#*LoadModule rewrite_module modules/mod_rewrite.so$|&\nLoadModule php5_module modules/libphp5.so|;
\|^Include /etc/httpd/conf/extra/php5_module.conf|d;
s|^Include conf/extra/httpd-default.conf$|&\nInclude /etc/httpd/conf/extra/php5_module.conf|;

# Include httpd-zoneminder.conf
\|^Include /etc/httpd/conf/extra/httpd-zoneminder.conf$|d;
s|^# Server-pool management (MPM specific)$|\nInclude /etc/httpd/conf/extra/httpd-zoneminder.conf\n&|;
# Include httpd-zoneminder.conf
\|^Include /etc/httpd/conf/extra/httpd-zoneminder.conf$|d;
s|^# Server-pool management (MPM specific)$|\nInclude /etc/httpd/conf/extra/httpd-zoneminder.conf\n&|;
# Use mod_mpm_prefork instead of mod_mpm_event.so (FS#39218).
s|^LoadModule mpm_event_module modules/mod_mpm_event.so$|#&\nLoadModule mpm_prefork_module modules/mod_mpm_prefork.so|;
# Use mod_mpm_prefork instead of mod_mpm_event.so (FS#39218).
s|^LoadModule mpm_event_module modules/mod_mpm_event.so$|#&\nLoadModule mpm_prefork_module modules/mod_mpm_prefork.so|;

# Zoneminder requires cgi
\|^#LoadModule cgi_module modules/mod_cgi.so$| s|#||;
# Zoneminder requires cgi
\|^#LoadModule cgi_module modules/mod_cgi.so$| s|#||;

# libphp5
\|^LoadModule php5_module modules/libphp5.so$|d;
s|^#*LoadModule rewrite_module modules/mod_rewrite.so$|&\nLoadModule php5_module modules/libphp5.so|;
\|^Include /etc/httpd/conf/extra/php5_module.conf|d;
s|^Include conf/extra/httpd-default.conf$|&\nInclude /etc/httpd/conf/extra/php5_module.conf|;
# libphp5
\|^LoadModule php5_module modules/libphp5.so$|d;
s|^#*LoadModule rewrite_module modules/mod_rewrite.so$|&\nLoadModule php5_module modules/libphp5.so|;
\|^Include /etc/httpd/conf/extra/php5_module.conf|d;
s|^Include conf/extra/httpd-default.conf$|&\nInclude /etc/httpd/conf/extra/php5_module.conf|;

# Include httpd-zoneminder.conf
\|^Include /etc/httpd/conf/extra/httpd-zoneminder.conf$|d;
s|^# Server-pool management (MPM specific)$|\nInclude /etc/httpd/conf/extra/httpd-zoneminder.conf\n&|;
# Include httpd-zoneminder.conf
\|^Include /etc/httpd/conf/extra/httpd-zoneminder.conf$|d;
s|^# Server-pool management (MPM specific)$|\nInclude /etc/httpd/conf/extra/httpd-zoneminder.conf\n&|;
