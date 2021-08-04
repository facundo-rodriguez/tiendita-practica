<?php

/* 
function oppenConnect(){


    $con=mysqli_connect(SERVER_NAME,USER_NAME,PASSWORD,DATABASE_NAME);

    if( mysqli_connect_errno() ){

        echo "hiciste algo mal :/".mysqli_connect_error();

        exit();
    }
   

    return $con;

    
}
*/

class db{

    protected $conexion;
    
    public function __construct(){

        $this->conexion=new mysqli(SERVER_NAME,USER_NAME,PASSWORD,DATABASE_NAME);
   
        if($this->conexion->connect_errno){

            echo "error en la conexion ". $this->conexion->connect_error;

            exit();
        }

        $this->conexion;

    }

    public function query($query){

        return $this->conexion->query($query);
    }

    public function prepare($query){

        return $this->conexion->prepare($query);

    }

    public function close(){

        return $this->conexion->close();
    }
}


?>