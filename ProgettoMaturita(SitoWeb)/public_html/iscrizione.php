<?php
    $cf=$_POST['cf'];
    $nome=$_POST['nome'];
    $cognome=$_POST['cognome'];
    $gara=$_POST['gara'];
    
    $targa=$_POST['targa'];
    $modello=$_POST['modello'];
    $marca=$_POST['marca'];
    
    $costruttore=$_POST['nomeCostruttore'];
    $paese=$_POST['paese'];

    $mysqli= new mysqli('localhost', 'root','', 'maturità');
    /*------------------------------------------------------------------------------------------------------- /
    if ($mysqli->connect_error) {
        die('Errore di connessione(' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
    } else {
     echo 'Connesso. ' . $mysqli->host_info . "\n<br>";
    }
    / ------------------------------------------------------------------------------------------------------ */
    if($cf == null || $nome == null || $cognome == null || $gara == null || $targa == null || $marca == null || $modello == null || $costruttore == null || $paese == null){
        header("Refresh:0, url=iscriviti.php");
    }else{
        $query1 = "INSERT INTO atleta(nome,cognome,cf,punteggio) VALUES ('$nome','$cognome','$cf',0)";
        $result =  $mysqli->query($query1);

        $query2 = "INSERT INTO ga(nome_gara,cf) VALUES ('$gara','$cf')";
        $result = $mysqli->query($query2);

        $query4 = "INSERT INTO costruttore(nome, paese) VALUES ('$costruttore', '$paese')";
        $result = $mysqli->query($query4);

        $queryS = "SELECT * FROM costruttore";
        $result = $mysqli->query($queryS);
        $costr = $result->fetch_assoc();

        $query3 = "INSERT INTO moto(targa, marca, modello, codC, cf) VALUES ('$targa','$marca', '$modello', '${costr['codC']}' ,'$cf')";
        $result = $mysqli->query($query3);

        header("Refresh:0, url=index.php");
    }   
        
?>
