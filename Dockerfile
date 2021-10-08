FROM alpine:3.13.5

COPY crontab /etc/crontabs/root
RUN chown root:root /etc/crontabs/root


RUN apk add --update --no-cache \
  rsyslog \
  curl \
  php8 \
  php8-fpm \
  php8-openssl \
  php8-phar \
  php8-iconv \
  php8-mbstring \
  php8-curl \
  php8-simplexml \
  php8-tokenizer \
  php8-pdo_mysql \
  php8-xml \
  php8-ctype \
  php8-dom \
  php8-gd \
  php8-fileinfo \
  php8-xmlreader \
  php8-xmlwriter \
  php8-zip \
  php8-session 

COPY rsyslog.conf /etc/rsyslog.conf

RUN mkdir /app
WORKDIR /app

RUN curl -sS https://getcomposer.org/installer | php8 -- --install-dir=/usr/bin --filename=composer  
RUN ln -s /usr/bin/php8 /usr/bin/php

RUN composer require monolog/monolog

COPY file0.php file1.php /app/

RUN chmod 755 /app/file0.php /app/file1.php

COPY cmd.sh /
RUN chmod 755 /cmd.sh

CMD ["/cmd.sh"]

EXPOSE 514