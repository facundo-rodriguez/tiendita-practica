<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>


</head>

<body>
    
<?php  

session_start();
include_once("configLogin.php");
include_once("conect_database.php");

define("MAX_FAILS","3");

if (!isset($_SESSION['fails'])) {
    $_SESSION['fails'] = 0;
}

$user=$_POST['username'];

$password=$_POST['password'];

$newPassword= md5($password);

$conn=new db();


$sql="select * from usuarios where(username='$user' or email='$user') and (password='$newPassword') ";

$result=$conn->query($sql);

$row=$result->fetch_assoc();



if($row==NULL){

    $_SESSION['fails']=$_SESSION['fails'] + 1;

    if($_SESSION['fails']==MAX_FAILS){

?>

    <div>
        
        <a href="index.html">x</a>
        
        <div>
            <h1>¡¡ERROR!! MAXIMA CANTIDAD DE INTENTOS</h1>
            <?php 
            session_destroy();
            ?>
        </div>

    </div>
   
   <?php

  
    }
    else{
    ?>    

    <div>
        
        <a href="../login.html">x</a>
        
        <div>
            <h1>¡¡ERROR!! LOGIN INVALIDO</h1>
        </div>

    </div>
    
<?php 
    echo $_SESSION['fails']; }

}
else{
    session_start();
    $_SESSION['time']=date('H:i:s');
    $_SESSION['username']=$user;
    $_SESSION['logueado']=true;
    header("location:welcome.php");
}


$conn->close();

?>



</body>
</html>


