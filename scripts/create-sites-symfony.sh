#!/usr/bin/env bash

PROJECT_NAME=$1

APP_CONFIG="server {
    listen       80;
    server_name  $PROJECT_NAME;
    root   \"/var/www/sites/$PROJECT_NAME/web\";

    rewrite ^/app\.php/?(.*)$ /\$1 permanent;

    try_files \$uri @rewrite;

    location @rewrite {
        rewrite ^(.*)$ /app.php/\$1 last;
    }

    location ~ ^/(app|app_dev|config)\.php {
        include                  fastcgi_params;
        fastcgi_keep_conn on;
        fastcgi_split_path_info  ^(.+\.php)(/.+)$;
        fastcgi_param PATH_INFO \$fastcgi_path_info;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        fastcgi_intercept_errors on;
        fastcgi_pass unix:/var/run/php-fpm.sock;
    }

    access_log  /var/log/nginx/$PROJECT_NAME-access.log  main;
    error_log   /var/log/nginx/$PROJECT_NAME-error.log;
}
"
sudo mkdir -p "/etc/nginx/sites-available" "/etc/nginx/sites-enabled"
sudo echo "$APP_CONFIG" > "/etc/nginx/sites-available/$PROJECT_NAME"
sudo ln -fs "/etc/nginx/sites-available/$PROJECT_NAME" "/etc/nginx/sites-enabled/$PROJECT_NAME"
sudo apachectl stop
sudo service nginx restart
sudo service php-fpm restart