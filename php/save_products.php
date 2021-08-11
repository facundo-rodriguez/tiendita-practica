<?php 

    session_start();

    if($_SESSION["logueado"]){

        include_once("upload_image.php");
        

        $modelo=$_POST["modelo"];
        $precio= $_POST["precio"];
        $descripcion=$_POST["descripcion"];
        $genero=$_POST["genero"];
        $disciplina=$_POST["disciplina"];
        $marcas=$_POST["marcas"];
        $path_img="images/".$nombre_img;

        include_once("config_productos.php");
        include_once("conect_database.php");
        
        $conn=new db();
        
        $sql="insert into zapatillas (modelo,precio,genero,id_marca,imagen,descripcion,id_disciplina) values(?,?,?,?,?,?,?)";

        $stmt=$conn->prepare($sql);
        $stmt->bind_param('sdsissi',$modelo,$precio,$genero,$marcas,$path_img,$descripcion,$disciplina);

        if($stmt->execute()){
        
    ?>
            <script>

                alert("se ingreso el producto: " + "<?php echo $modelo ?>");

                window.location="insert_products.php";

            </script>  

<?php 
        
    }
        
}
?>

