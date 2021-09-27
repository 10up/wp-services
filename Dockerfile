ARG PHP_VERSION=7.1

# Set a BASE_IMAGE CI var to specify a different base image
ARG BASE_IMAGE=10up/wp-php-fpm
FROM ${BASE_IMAGE}:${PHP_VERSION}-ubuntu

ARG PHP_VERSION=7.1

USER root
RUN \
  export DEBIAN_FRONTEND=noninteractive && \
  apt-get update && \
  apt-get install -y \
    mariadb-client \
    netcat \
    wget \
    telnet \
    rsync \
    vim \
    screen \
    less \
    unzip && apt clean all

WORKDIR /
COPY scripts/composer-installer.sh /composer-installer.sh
RUN sh /composer-installer.sh && mv /composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer
RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp
RUN rm -f /var/log/newrelic/*

USER www-data
RUN touch ~/.bashrc

WORKDIR /var/www/html
