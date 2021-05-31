<?php
    $info= new mysqli('localhost', 'root','', 'maturità');
    $gara = $_GET['gara'];
    /*------------------------------------------------------------------------------------------------------- /
    if ($mysqli->connect_error) {
        die('Errore di connessione(' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
    } else {
     echo 'Connesso. ' . $mysqli->host_info . "\n<br>";
    }
    / ------------------------------------------------------------------------------------------------------ */
    $query = "SELECT *
              FROM gara,orario
              WHERE gara.nome_gara = '$gara'
              AND gara.nome_gara = orario.nome_gara
             ";
    $result =  $info->query($query);
    echo"
        <html>
                <head>
                    <title>Progetto Maturità | Info Gara</title>
                    <meta charset='UTF-8'>
                    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
                    <link href='stileInfo.css' rel='stylesheet' type='text/css'/>
                </head>
                <body>
                    <div class='container'>
                        <div class='row'>  
    ";
    while ($gara = $result->fetch_assoc()) {
        echo "
            <div class='card'>
                <div class='card-header'>
                    <h1>${gara['nome_gara']}</h1>
                </div>
                <div class='card-body'>
                    <p>
                        <p><b><u style='color:red; font-size:90%;'>Data Svolgimento</u>:</b> <b style='font-size:75%;'>${gara['data_inizio']}</b></p><br>
                        <p><b><u style='color:red; font-size:90%;'>Categoria</u>:</b> <b style='font-size:75%;'>${gara['categoria']}</b></p><br>
                        <p><b><u style='color:red; font-size:90%;'>Orario di Partenza</u>:</b> <b style='font-size:75%;'>${gara['orario_inizio']}</b></p><br>
                    </p>
                </div>
            </div>";
    }
echo"
                </div>
            </div>
        </body>
    </html>
";
?>