FROM ubuntu:trusty-20160711
#silence install errors from apt-get
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && apt-get -y dist-upgrade --fix-missing
RUN mkdir /vertex

#php
RUN apt-get install -y wget php5-cli php5-odbc unixodbc

#install composer
RUN cd /usr/local/bin; wget -O - https://getcomposer.org/installer | php

#the layers above should be cached for quick rebuilds with the new code base
COPY . /vertex
WORKDIR /vertex
COPY bin/etc/. /etc
ENV PATH /opt/vertica/bin:/vertex/bin:$PATH

#run composer
RUN php -d allow_url_fopen=1 /usr/local/bin/composer.phar validate && php -d allow_url_fopen=1 /usr/local/bin/composer.phar install --no-dev && php -d allow_url_fopen=1 /usr/local/bin/composer.phar dump-autoload --optimize
RUN chmod +x /vertex/bin/*

