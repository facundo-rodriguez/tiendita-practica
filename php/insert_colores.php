<?php 

session_start();

if($_SESSION["logueado"]){

    include_once("config_productos.php");
    include_once("conect_database.php");
   
    $conn=new db;

    if( isset($_POST['añadir-color']) ){

    $modelo=$_POST["modelo"];
    $color=$_POST["colores"];

    $sql="insert into colores_zapatillas (id_color,id_zapatilla) values(?,?)";

    
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

  if( isset($_POST['lista-color']) ){

    $masColor=$_POST['mas-colores'];

    $sql2="insert into colores (descripcion) values (?)";

    $stmt2=$conn->prepare($sql2);
    $stmt2->bind_param("s",$masColor);

    if($stmt2->execute()){

?>     
        <script>
            
            alert("color ingresado");
            window.location="insert_products.php"


        </script>

<?php
    }

  }

   if(isset($_POST['delete-color'])){

       $borrar_color=$_POST['color'];

       $sql3="delete from colores where id_color=".$borrar_color;

       $result=$conn->query($sql3);

       header("location:insert_products.php");
   }

   if(isset($_POST['CM-delete'])){

        $zapatilla=$_POST['modelo-color'];
        $colores=$_POST['color-modelo'];

        $sql4="delete from colores_zapatillas where id_color='$colores' and id_zapatilla='$zapatilla'";

        $result=$conn->query($sql4);

        header("location:insert_products.php");
   }

}
?>