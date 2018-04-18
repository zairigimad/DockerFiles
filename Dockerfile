FROM php:7.2.4-fpm-alpine
LABEL maintainer="imadzairig@gmail.com"

WORKDIR "/app"

# Installer Composer 
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \

#Installer les extensions postgresql    
RUN     set -ex \
        && apk --no-cache add postgresql-dev \
        && docker-php-ext-install pdo pdo_pgsql

#Installer Git for composer needs
RUN apk update && apk upgrade  \
    && apk add --no-cache bash git openssh