# Usamos una imagen ligera de PHP 8.1 con Apache
FROM php:8.1-apache

# Instalamos las extensiones necesarias para que PHP se comunique con MySQL
# Esto es vital para que tu db.php funcione dentro del contenedor
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Habilitamos el módulo rewrite de Apache (común en servidores profesionales)
RUN a2enmod rewrite

# Copiamos todo el contenido de tu carpeta actual al directorio del servidor en el contenedor
COPY . /var/www/html/

# Ajustamos los permisos para que Apache pueda leer tus archivos sin problemas
RUN chown -R www-data:www-data /var/www/html/

# Exponemos el puerto 80 para poder ver la web en el navegador
EXPOSE 80