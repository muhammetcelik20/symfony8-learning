FROM php:8.4-cli

# System deps
RUN apt-get update && apt-get install -y \
    git unzip zip curl \
    libzip-dev \
    && docker-php-ext-install zip

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Ensure php is in PATH (safety)
RUN which php && php -v

WORKDIR /workspace
