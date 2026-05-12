<?php
$host = "db";       // ← de "localhost" a "db"
$user = "root";
$pass = ""; // En XAMPP por defecto está vacío
$db   = "devioz_db";

$conexion = mysqli_connect($host, $user, $pass, $db);

if (!$conexion) {
    die("Error de conexión: " . mysqli_connect_error());
}
?>