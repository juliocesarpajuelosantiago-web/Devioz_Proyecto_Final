# 1. Imagen base oficial de PHP 8.1 con Apache
# Proporciona un servidor web Apache listo para ejecutar aplicaciones PHP.
FROM php:8.1-apache

# 2. Actualiza los paquetes del sistema operativo
# Esto ayuda a corregir vulnerabilidades conocidas antes de construir la imagen.
RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

# 3. Instala las extensiones necesarias para conectarse a MySQL
# mysqli: permite usar mysqli_connect()
# pdo: interfaz de acceso a bases de datos
# pdo_mysql: controlador MySQL para PDO
RUN docker-php-ext-install mysqli pdo pdo_mysql

# 4. Habilita el módulo rewrite de Apache
# Se utiliza para URLs amigables y reglas del archivo .htaccess.
RUN a2enmod rewrite

# 5. Copia el código fuente de la aplicación al servidor Apache
COPY . /var/www/html/

# 6. Expone el puerto HTTP estándar
# Indica que la aplicación escuchará en el puerto 80.
EXPOSE 80