FROM phusion/baseimage:0.9.12
MAINTAINER Yaron Tal

ENV HOME /root
CMD ["/sbin/my_init"]

# Update and install packages
RUN apt-get update
RUN apt-get install -y curl git
RUN apt-get install -y -q php5-cli php5-curl

# Behat alias in docker container
ADD behat /var/behat/behat
RUN chmod +x /var/behat/behat

# Install Behat
RUN mkdir -p /var/behat/composer
ADD composer.json /var/behat/composer/composer.json
RUN cd /var/behat/composer && curl http://getcomposer.org/installer | php
RUN cd /var/behat/composer && php composer.phar install --prefer-source


RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
