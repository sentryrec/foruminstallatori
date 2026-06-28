FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    libzip-dev \
 && docker-php-ext-install mysqli zip

ENV MYBB_VERSION=1840

RUN wget https://resources.mybb.com/downloads/mybb_${MYBB_VERSION}.zip -O /tmp/mybb.zip \
 && unzip /tmp/mybb.zip -d /tmp \
 && mkdir -p /var/www/html \
 && cp -R /tmp/Upload/* /var/www/html/ \
 && rm -rf /tmp/*

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

WORKDIR /var/www/html

ENTRYPOINT ["/entrypoint.sh"]

CMD ["php-fpm"]