<?php
include('db.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = mysqli_real_escape_string($conexion, $_POST['nombre']);
    $correo = mysqli_real_escape_string($conexion, $_POST['correo']);
    $asunto = mysqli_real_escape_string($conexion, $_POST['asunto']);
    $mensaje = mysqli_real_escape_string($conexion, $_POST['mensaje']);

    $sql = "INSERT INTO consultas (nombre, correo, asunto, mensaje) 
            VALUES ('$nombre', '$correo', '$asunto', '$mensaje')";

    if (mysqli_query($conexion, $sql)) {
        // TRUCO: Muestra alerta y regresa al index.html de inmediato
        echo "<script>
                alert('¡Registro exitoso en DEVIOZ!');
                window.location.href='index.html';
              </script>";
    } else {
        echo "Error: " . mysqli_error($conexion);
    }
}
mysqli_close($conexion);
?>