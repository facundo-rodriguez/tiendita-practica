
<?php 
session_start();

if($_SESSION["logueado"]){

    include_once("config_productos.php");
    include_once("conect_database.php");

    $modelo=$_POST["modelo"];

    $sql2="delete from colores_zapatillas where id_zapatilla=".$modelo;

    $sql="delete from zapatillas where id_zapatilla=".$modelo;

   

    $conn=new db();
    $result=$conn->query($sql2);
    $result=$conn->query($sql);
   

    header("location:insert_products.php");
}

?>