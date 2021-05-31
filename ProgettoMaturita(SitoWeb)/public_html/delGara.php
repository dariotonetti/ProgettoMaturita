<?php
    $nome=$_POST['nomeGara'];
    $orario=$_POST['orario'];
    $data=$_POST['data'];
    $mysqli= new mysqli('localhost', 'root','', 'maturità');
    /*------------------------------------------------------------------------------------------------------- /
    if ($mysqli->connect_error) {
        die('Errore di connessione(' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
    } else {
     echo 'Connesso. ' . $mysqli->host_info . "\n<br>";
    }
    / ------------------------------------------------------------------------------------------------------ */
    if($nome == null || $orario == null || $data == null){
        header("Refresh:0, url=console.html");
    }else{
        $query1 = "DELETE FROM orario 
                   WHERE nome_gara = '$nome' 
                   AND data_inizio = '$data' 
                   AND orario_inizio = '$orario'
                  ";
        $result =  $mysqli->query($query1);
        header("Refresh:0, url=index.php");
    }
?>
