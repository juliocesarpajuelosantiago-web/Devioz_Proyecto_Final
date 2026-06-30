FROM php:8.1-apache 
# Imagen base con PHP 8.1 y Apache


RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/* 
# Actualiza paquetes y limpia caché

RUN a2enmod rewrite 
# Activa rewrite de Apache

COPY . /var/www/html/
 # Copia el proyecto dentro del servidor Apache

EXPOSE 80 
# Expone el puerto web del contenedor