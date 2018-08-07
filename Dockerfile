FROM ubuntu:xenial-20180726

#silence install errors from apt-get
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && apt-get -y dist-upgrade --fix-missing
RUN mkdir /vertex && mkdir /vertex/test-reports

#install php
RUN apt-get install -y wget php7.0-cli php7.0-odbc unixodbc php7.0-xml php7.0-mbstring zip unzip php7.0-zip

#install phpunit
RUN wget -O /usr/local/bin/phpunit -q https://phar.phpunit.de/phpunit-6.5.phar && chmod +x /usr/local/bin/phpunit

#the layers above should be cached for quick rebuilds with the new code base
COPY . /vertex
WORKDIR /vertex
