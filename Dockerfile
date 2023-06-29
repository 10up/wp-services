ARG PHP_VERSION=8.2

# Set a BASE_IMAGE CI var to specify a different base image
ARG BASE_IMAGE=ghcr.io/10up/wp-php-fpm
FROM ${BASE_IMAGE}:${PHP_VERSION}-ubuntu

ARG PHP_VERSION=8.2

ENV DEBIAN_FRONTEND noninteractive

USER root
RUN \
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
    unzip && apt clean all && rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY scripts/composer-installer.sh /usr/local/bin/composer-installer.sh
COPY scripts/composer /usr/local/bin/composer
RUN \
  chmod +x /usr/local/bin/composer && \
  chmod +x /usr/local/bin/composer-installer.sh && \
  /usr/local/bin/composer-installer.sh
RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

USER www-data
RUN touch ~/.bashrc

RUN \
  curl -o /tmp/snapshots.zip https://codeload.github.com/10up/snapshots/zip/refs/tags/1.1.0 && \
  wp package install /tmp/snapshots.zip && \
  rm -f /tmp/snapshots.zip


WORKDIR /var/www/html
ENTRYPOINT ["/bin/bash", "-l"]
