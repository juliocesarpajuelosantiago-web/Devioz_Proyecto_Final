<?php
// Credenciales estándar de XAMPP
$servidor = "db";   // ← de "localhost" a "db"
$usuario  = "root";
$password = ""; 
$base_datos = "devioz_db";

// Crear la conexión
$conexion = mysqli_connect($servidor, $usuario, $password, $base_datos);

// Verificar si hay error
if (!$conexion) {
    die("La conexión falló: " . mysqli_connect_error());
}
?>