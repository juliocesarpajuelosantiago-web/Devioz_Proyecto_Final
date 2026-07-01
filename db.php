<?php

$servidor = getenv('DB_HOST');
$usuario = getenv('DB_USER');
$password = getenv('DB_PASSWORD');
$base_datos = getenv('DB_NAME');

$conexion = mysqli_connect($servidor, $usuario, $password, $base_datos);

if (!$conexion) {
    die("Error de conexión: " . mysqli_connect_error());
}
?>