FROM php:8.1.10-fpm-alpine as php
RUN apk update
RUN docker-php-ext-install pdo pdo_mysql bcmath

WORKDIR /var/www
COPY . .

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

ENV PORT=8000
ENTRYPOINT [ "./docker/entrypoint.sh" ]
