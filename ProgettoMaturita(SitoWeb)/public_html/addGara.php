<?php
    $nome=$_POST['nomeGara'];
    $categoria=$_POST['categoria'];
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
    if($nome == null || $categoria == null || $orario == null || $data == null){
        header("Refresh:0, url=console.html");
    }else{
        $query1 = "INSERT INTO gara(nome_gara,categoria) VALUES ('$nome','$categoria')";
        $result =  $mysqli->query($query1);
        $query2 = "INSERT INTO orario(orario_inizio, data_inizio, nome_gara) VALUES ('$orario','$data', '$nome')";
        $result1 =  $mysqli->query($query2);

        header("Refresh:0, url=index.php");
    }
?>
