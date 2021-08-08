<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

    <div class="container">
        <h3>ingreso de productos</h3>
    </div>

    <div class="formulario">
        <form action="save_products.php" method="post">
           
            <div> 
                <label for="modelo" class="control-label">MODELO</label>
                <input type="text" id="modelo" name="modelo" require="" placeholder="MODELO">
            </div>

            <div>
                <label for="precio" class="control-label">PRECIO</label>
                <input type="text" id="precio" name="precio" require="" placeholder="PRECIO">
            </div>
           
            <div>
                <label for="descripcion" class="control-label">DESCRIPCION</label>
                <textarea name="descripcion" id=""  rows="3"></textarea>
            </div>

            <div>
                <label for="genero" class="control-label">GENERO</label>
                <select name="genero" id="">
                   
                    <option value="mujer">MUJER</option>
                    <option value="hombre">HOMBRE</option>
                    <option value="niños">NIÑOS</option>

                </select>
            </div>

            <div>

            
                <label for="disciplina" class="control-label">DISCIPLINA</label>
                <select name="disciplina" id="">
                    <?php
                        
                        include_once("config_productos.php");
                        include_once("conect_database.php");

                        $conn=new db();

                        $sql="select id_disciplina as id, descripcion as descripcion from discplina order by descripcion";

                        $result=$conn->query($sql);

                        while($row=$result->fetch_assoc()){
                    ?>            

                        <option value="<?php echo $row["id"] ?>"> <?php echo $row["descripcion"] ?></option>

                    <?php
                        }  
                    ?>                   
               </select>
            </div>

            <div>

                <label for="marcas" class="control-label">MARCAS</label>

                <select name="marcas" id="">

                    <?php 

                        #include_once("config_productos.php");
                        #include_once("conect_database.php");

                        $sql2="select id_marca as id, descripcion as descripcion from marcas order by descripcion;";

                        $result=$conn->query($sql2);

                        while($row=$result->fetch_assoc()){
                    ?>            

                        <option value="<?php echo $row["id"] ?>"> <?php echo $row["descripcion"] ?></option>

                    <?php
                        }  
                    ?>   
                </select>
            </div>
            
            <div>
                <label for="imagen" class="control-label">IMAGEN</label>
                
                <input type="file" id="imagen" name="imagen" size="30">
            </div>
            
            <div>
                <input type="submit" value="Añadir producto">
            </div>
        </form>
    </div>



</body>
</html>