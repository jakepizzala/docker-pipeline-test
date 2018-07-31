FROM ubuntu:xenial-20180726
#silence install errors from apt-get
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && apt-get -y dist-upgrade --fix-missing
RUN mkdir /vertex

#php
RUN apt-get install -y wget php7.0-cli php7.0-odbc unixodbc

#install composer
RUN cd /usr/local/bin; wget -O - https://getcomposer.org/installer | php

#the layers above should be cached for quick rebuilds with the new code base
COPY . /vertex

#run composer
RUN php -d allow_url_fopen=1 /usr/local/bin/composer.phar validate && php -d allow_url_fopen=1 /usr/local/bin/composer.phar install --no-dev && php -d allow_url_fopen=1 /usr/local/bin/composer.phar dump-autoload --optimize
