FROM php:7-apache

RUN docker-php-ext-install mysqli
RUN apt-get update -y && apt-get install -y zlib1g-dev libpng-dev libjpeg-dev
RUN docker-php-ext-configure gd --with-jpeg
RUN docker-php-ext-install gd
RUN a2enmod rewrite
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
