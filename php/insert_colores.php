<?php 

session_start();

if($_SESSION["logueado"]){

    include_once("config_productos.php");
    include_once("conect_database.php");
   
    $modelo=$_POST["modelo"];
    $color=$_POST["colores"];

    $sql="insert into colores_zapatillas (id_color,id_zapatilla) values(?,?)";

    $conn=new db;
    $stmt=$conn->prepare($sql);
    $stmt->bind_param("ii",$color,$modelo);

    if($stmt->execute()){
?>
        <script>
            
            alert("color ingresado");
            window.location="insert_products.php"

        </script>

<?php
    }
}
?>