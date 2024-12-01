FROM dunglas/frankenphp:1.3.3-php8.3.14

ARG LARAVEL_APP_PATH

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    git \
    unzip \
    librabbitmq-dev \
    libpq-dev

RUN install-php-extensions \
    gd \
    pcntl \
    opcache \
    pdo \
    pdo_mysql \
    redis \
    mbstring \
    zip \
    exif \
    sockets

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /app/public

COPY ${LARAVEL_APP_PATH} .

COPY ./docker/frankenphp/php.ini /usr/local/etc/php/

RUN composer install