<?php
    $nome=$_POST['nomeSponsor'];
    $percentuale = $_POST['percentuale'];
    $mysqli= new mysqli('localhost', 'root','', 'maturità');
    /*------------------------------------------------------------------------------------------------------- /
    if ($mysqli->connect_error) {
        die('Errore di connessione(' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
    } else {
     echo 'Connesso. ' . $mysqli->host_info . "\n<br>";
    }
    / ------------------------------------------------------------------------------------------------------ */
    if($nome == null || $percentuale == null){
        header("Refresh:0, url=console.html");
    }else{
        $query1 = "INSERT INTO sponsor(nome_sponsor, percentuale) VALUES ('$nome', '$percentuale')";
        $result =  $mysqli->query($query1);

        header("Refresh:0, url=console.html");
    }
?>