FROM php:7.1
MAINTAINER <fahim.shoumik@gmail.com>

RUN apt-get update \
    && apt-get install -qq git curl libmcrypt-dev libjpeg-dev libpng-dev libfreetype6-dev libbz2-dev \
    && apt-get clean

# Install needed extensions
RUN docker-php-ext-install mcrypt pdo_mysql zip

# Install Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Dependency
RUN composer update
