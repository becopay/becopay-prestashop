
FROM becopay/alpine-nginx-php

LABEL maintainer="io@becopay.com"
LABEL version="1.7.4.4"
LABEL description="PrestaShop with becopay plugin Docker"

ENV PRESTASHOP_VERSION 1.7.4.4
ENV BECOPAY_VERSION master

ENV INSTALL_DIR /var/www/html

ADD ./php.ini /etc/php7/php.ini
ADD ./php-fpm.conf /etc/php7/php-fpm.conf

ADD ./nginx.conf /etc/nginx/conf.d/default.conf

RUN apk add php7-fileinfo
RUN chsh -s /bin/bash www-data

RUN cd /tmp && \ 
  curl https://codeload.github.com/PrestaShop/PrestaShop/tar.gz/$PRESTASHOP_VERSION -o $PRESTASHOP_VERSION.tar.gz && \
  tar xvf $PRESTASHOP_VERSION.tar.gz && \
  mv PrestaShop-$PRESTASHOP_VERSION/* $INSTALL_DIR

RUN cd /tmp && \
  curl https://codeload.github.com/becopay/Prestashop-Becopay-Gateway/tar.gz/$BECOPAY_VERSION -o $BECOPAY_VERSION.tar.gz && \
  tar xvf $BECOPAY_VERSION.tar.gz && \
  mv Prestashop-Becopay-Gateway-$BECOPAY_VERSION/becopay  $INSTALL_DIR/modules/becopay

RUN cd $INSTALL_DIR && composer install

RUN chown -R www-data:www-data /var/www

COPY ./install-prestashop /usr/local/bin/install-prestashop
RUN chmod +x /usr/local/bin/install-prestashop

RUN cd $INSTALL_DIR \
    && find . -type d -exec chmod 770 {} \; \
    && find . -type f -exec chmod 660 {} \;


RUN rm -rf /tmp/*

WORKDIR $INSTALL_DIR
