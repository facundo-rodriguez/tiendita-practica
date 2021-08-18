<?php

    session_start();

    include_once("config_productos.php");
    include_once("conect_database.php");
   


    $conn=new db();

    $modelo_color=filter_input(INPUT_POST,'modelo_color');

    $sql="SELECT z.id_zapatilla as idZ, z.modelo as modelo, c.id_color as idC, c.descripcion as descripcion from zapatillas z, colores c, colores_zapatillas cz
           WHERE z.id_zapatilla='$modelo_color' and z.id_zapatilla=cz.id_zapatilla and c.id_color=cz.id_color";

    $result=$conn->query($sql);

    while($row=$result->fetch_assoc()){

?>

        <option value="<?php echo $row['idC'] ?>"> <?php echo $row['descripcion']?> </option>

<?php
    }
?>