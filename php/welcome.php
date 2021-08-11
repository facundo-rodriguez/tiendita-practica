<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

    <nav>
        <div>
            <h1>Area privada</h1>
            <a href="logout.php">Logout</a>
        </div>
    </nav>

    <div>
        <?php

             session_start();

             if($_SESSION['logueado']){

              echo "Bienvenido ".$_SESSION["username"]."<br>";
              echo "hora de conexion ".$_SESSION["time"]."<br>";

            }
        ?>

        <a href="insert_products.php" role="button">ingresar productos</a>
        <a href="../cambiar_usuario.html" role="button">modificar el usuario</a>

    </div>

</body>
</html>

