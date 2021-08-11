<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <header>
        <h1>GALERIA DE PRODUCTOS</h1>
    </header>

    <main>
        <section id="products">
            <ul class="gallery">
                
                <?php
                    include_once("php/config_productos.php");
                    include_once("php/conect_database.php");

                    $sql="select z.id_zapatilla as id, z.imagen as imagen, m.descripcion as descripcion, z.modelo as modelo, date_format(z.fecha_alta,'%d/%m/%Y') as fecha, z.precio as precio, d.descripcion as disciplina
                          from zapatillas z, marcas m, discplina d where z.id_marca=m.id_marca and z.id_disciplina=d.id_disciplina";

                    $conn=new db;
                    $result=$conn->query($sql);

                    while($row=$result->fetch_assoc()){
                ?>
                
                <li>
                    <figure><img src="<?php echo $row['imagen']?>" alt="">
                        
                        <figcaption>
                            <h3><?php echo $row['modelo'] ." ". $row['descripcion'] ?></h3>
                            
                            <h5><?php echo $row['precio'] ?></h5>
                            <time><?php echo $row['fecha'] ?></time>
                           
                        </figcaption>
                    
                    </figure>
                    <div>
                        <h4><a href="">agregar carrito</a></h4>
                    </div>   
                </li>

                <?php
                    }
                ?>
            </ul>
        </section>
    </main>

    <footer>
        <a href="login.html">area privada</a>
    </footer>


    
</body>
</html>