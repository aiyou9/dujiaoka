#FROM webdevops/php-nginx:7.4
#COPY . /app
#WORKDIR /app
#RUN [ "sh", "-c", "composer install --ignore-platform-reqs" ]
#RUN [ "sh", "-c", "chmod -R 777 /app" ]

FROM richarvey/nginx-php-fpm:1.7.2

COPY . .
# COPY . /app
WORKDIR /app
# Image config
ENV SKIP_COMPOSER 1
ENV WEBROOT /var/www/html/public
ENV PHP_ERRORS_STDERR 1
ENV RUN_SCRIPTS 1
ENV REAL_IP_HEADER 1

# Laravel config
ENV APP_ENV production
ENV APP_DEBUG false
ENV LOG_CHANNEL stderr

# Allow composer to run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

CMD ["/start.sh"]
