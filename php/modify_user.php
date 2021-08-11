<?php 

session_start();

if($_SESSION["logueado"]){

    include_once("configLogin.php");
    include_once("conect_database.php");
 
    $user1=$_POST["user"];
    $password=$_POST["contraseña"];
    $email=$_POST["email"];

    
    #$sql="update usuarios set username="."'".$user1."'". " " . "where (username="."'".$_SESSION['username']."'". " " ."or". " ". "email=". "'".$_SESSION['username']."')";
    #$sql2="update usuarios set password=md5(".$password.")"." "."where (username="."'".$_SESSION['username']."'". " " ."or". " ". "email=". "'".$_SESSION['username']."')";
    #$sql3="update usuarios set email="."'".$email."'". " ". "where (username="."'".$_SESSION['username']."'". " " ."or". " ". "email=". "'".$_SESSION['username']."')";
   
    #$sql4="update usuarios set fecha_alta=date_format(fecha_alta,'%d/%m/%Y') where username="."'".$_SESSION['username']."'";
    
    #$sql="update usuarios set username="."'".$user1."'".","."email="."'".$email."'".","."password=md5(".$password.")"." ". "where (username="."'".$_SESSION['username']."'". " " ."or". " ". "email=". "'".$_SESSION['username']."')";
    $sql="update usuarios set username='$user1',email='$email',password=md5('$password') where (username="."'".$_SESSION['username']."' ". " or ". " email="."'".$_SESSION['username']."')";

    $conn=new db();

    
    $result=$conn->query($sql);
    #$result2=$conn->query($sql2);
    #$result3=$conn->query($sql3);
    #$result4=$conn->query($sql4);
    

    if($result){

       $_SESSION['username']=$user1;
       
?>
        <script>
            alert("usuario,email y contraseña modificado"+"<?php echo $_SESSION['username'] ?>");
            window.location="welcome.php"
        </script>
<?php
    
    }
    else{
?>
        <script>
        alert("algo salio mal :/"+"<?php echo $_SESSION['username'] ?>");
        window.location="welcome.php";
        </script>
<?php
    }
}
$conn->close();
?>
   