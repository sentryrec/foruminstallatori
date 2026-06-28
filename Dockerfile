FROM php:8.3-apache

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    libzip-dev \
 && docker-php-ext-install mysqli zip \
 && a2enmod rewrite

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
