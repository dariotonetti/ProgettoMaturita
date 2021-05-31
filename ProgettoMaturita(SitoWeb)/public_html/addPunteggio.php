<?php
    $nome=$_POST['nome'];
    $cognome=$_POST['cognome'];
    $cf=$_POST['cf'];
    $punteggioAggiungere = $_POST['punteggio'];

    $mysqli= new mysqli('localhost', 'root','', 'maturità');
    /*------------------------------------------------------------------------------------------------------- /
    if ($mysqli->connect_error) {
        die('Errore di connessione(' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
    } else {
     echo 'Connesso. ' . $mysqli->host_info . "\n<br>";
    }
    / ------------------------------------------------------------------------------------------------------ */
    if($nome == null || $cognome == null || $cf == null){
        header("Refresh:0, url=console.html");
    }else{
        $query1 = "SELECT punteggio
                   FROM atleta
                   WHERE atleta.cf = '$cf'
                   AND atleta.nome = '$nome'
                   AND atleta.cognome = '$cognome'";
        $result =  $mysqli->query($query1);
        $punteggio = $result->fetch_assoc();

        $punteggioAggiornato = $punteggio['punteggio']+$punteggioAggiungere;

        echo"$punteggioAggiornato";
        $query2 = "UPDATE atleta
                   SET punteggio=$punteggioAggiornato
                   WHERE cf= '$cf'
                   AND nome = '$nome'
                   AND cognome = '$cognome'";
        $result = $mysqli->query($query2);

        header("Refresh:0, url=index.php");
    }
?>
