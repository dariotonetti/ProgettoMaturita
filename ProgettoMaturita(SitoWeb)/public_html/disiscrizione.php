<?php
    $cf=$_POST['cf'];
    $nome=$_POST['nome'];
    $cognome=$_POST['cognome'];
    $categoria=$_POST['categoria'];
    $atleta= new mysqli('localhost', 'root','', 'maturità');
    /*------------------------------------------------------------------------------------------------------- /
    if ($mysqli->connect_error) {
        die('Errore di connessione(' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
    } else {
     echo 'Connesso. ' . $mysqli->host_info . "\n<br>";
    }
    / ------------------------------------------------------------------------------------------------------ */
    $query = "DELETE FROM atleta 
              WHERE cf='$cf'
              AND nome='$nome'
              AND cognome='$cognome'
              ";
    $result =  $atleta->query($query);
    header("Refresh:0, url=index.php");
?>
