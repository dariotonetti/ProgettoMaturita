<?php
    $mysqli= new mysqli('localhost', 'root','', 'maturità');
    $gara=$_GET['gara'];
    $posizione = 0;
    /*------------------------------------------------------------------------------------------------------- /
    if ($mysqli->connect_error) {
        die('Errore di connessione(' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
    } else {
     echo 'Connesso. ' . $mysqli->host_info . "\n<br>";
    }
    / ------------------------------------------------------------------------------------------------------ */
    $query = "SELECT gara.nome_gara,atleta.cognome,atleta.nome,moto.modello
              FROM atleta,ga,gara,moto
              WHERE atleta.cf = ga.cf
              AND gara.nome_gara = ga.nome_gara
              AND gara.nome_gara = '$gara'
              AND atleta.cf = moto.cf
              ";
    $result =  $mysqli->query($query);

    echo"
        <html>
            <head>
                <title>Classifica | $gara</title>
                <link href='stileClassifica.css' rel='stylesheet' type='text/css'/>
            </head>
            <body>
                <div class='titolo'><h2>$gara</h2></div>
                <h2>Classifica</h2>
                <table>
                    <tr>
                        <th>Posizione</th>
                        <th>Atleta</th>
                        <th>Moto</th>
                    </tr>
    ";
    while ($gara = $result->fetch_assoc()) {
            $posizione++;
            echo"
                <tr>
                    <td>$posizione °</td>
                    <td>${gara['cognome']} ${gara['nome']}</td>
                    <td>${gara['modello']}</td>
                </tr>
            ";
    }
    echo"</table>
            </body>
        </html>";
?>