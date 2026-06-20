FROM php:8.1-apache

# 1. Actualizamos el sistema operativo Debian y parchamos sus vulnerabilidades de fábrica
RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

# 2. Habilitamos el módulo rewrite de Apache de forma correcta
RUN a2enmod rewrite

# 3. Copiamos los archivos de tu landing page al servidor
COPY . /var/www/html/

# 4. Exponemos el puerto estándar
EXPOSE 80