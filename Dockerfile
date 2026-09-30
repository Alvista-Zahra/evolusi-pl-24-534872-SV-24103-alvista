FROM php:8.3-cli

WORKDIR /var/www/html

# Install dependency sistem dan ekstensi PHP
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libsqlite3-dev \
    && docker-php-ext-install pdo_sqlite \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Salin file dependency terlebih dahulu agar layer dapat di-cache
COPY composer.json composer.lock ./

# Install dependency Laravel tanpa menjalankan script
RUN composer install \
    --no-dev \
    --optimize-autoloader \
    --no-interaction \
    --prefer-dist \
    --no-scripts

# Salin source code setelah dependency selesai
COPY . .

# Jalankan Laravel package discovery setelah source code tersedia
RUN php artisan package:discover --ansi

# Pastikan folder Laravel dapat ditulis
RUN chmod -R 775 storage bootstrap/cache

EXPOSE 8000

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]