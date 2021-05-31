<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Progetto Maturità | Iscrizione Gara</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body><br><br>
            <div class="login-wrapper">
                <form action="iscrizione.php" class="form" method="POST">
                    <h2>Iscrizione Atleta</h2>
                    <div class="input-group">
                        <input type="text" name="cf" required>
                        <label for="loginCf">Codice Fiscale</label>
                    </div>
                    <div class="input-group">
                        <input type="text" name="nome" required>
                        <label for="loginNome">Nome</label>
                    </div>
                    <div class="input-group">
                        <input type="text" name="cognome" required>
                        <label for="loginCognome">Cognome</label>
                    </div>
                    <div class="input-group">
                        <select name="gara">
                            <?php
                                $info= new mysqli('localhost', 'root','', 'maturità');
                                $nomegara = $_GET['gara'];
                                /*------------------------------------------------------------------------------------------------------- /
                                if ($mysqli->connect_error) {
                                    die('Errore di connessione(' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
                                } else {
                                    echo 'Connesso. ' . $mysqli->host_info . "\n<br>";
                                }
                                / ------------------------------------------------------------------------------------------------------ */
                                $query = "SELECT * 
                                          FROM gara";
                                $result =  $info->query($query);
                                while ($gara = $result->fetch_assoc()) {
                                    echo "
                                        <option value='${gara['nome_gara']}'>${gara['nome_gara']}</option>
                                    ";
                                }
                            ?>
                        </select>
                        <label for="loginCf">Gara</label>
                    </div>
                    <h2>Iscrizione Moto</h2>
                    <div class="input-group">
                        <input type="text" name="targa" required>
                        <label for="loginTarga">Targa</label>
                    </div>
                    <div class="input-group">
                        <input type="text" name="marca" required>
                        <label for="loginMarca">Marca</label>
                    </div>
                    <div class="input-group">
                        <input type="text" name="modello" required>
                        <label for="loginModello">Modello</label>
                    </div>
                    <h2>Iscrizione Costruttore</h2>
                    <div class="input-group">
                        <input type="text" name="nomeCostruttore" required>
                        <label for="loginNomeCostruttore">Nome</label>
                    </div>
                    <div class="input-group">
                        <input type="text" name="paese" required>
                        <label for="loginPaese">Paese</label>
                    </div>
                    <input type="checkbox" value="sicurezza">&nbspAccetta termini sulla sicurezza e privacy. <b><a href="#" style='color:#ff652f;'>Leggi qui</a></b><br><br>
                    <input type="submit" value="Iscriviti" class="submit-btn"><br>
                    <div style="text-align:center; font-size:20px;">
                        Sei già iscritto e non vuoi più partecipare?<br>
                        <b><a href="disiscrizione.html" style='color:#ff652f;'>Disiscriviti</a></b>
                    </div><br>
                </form>
            </div><br><br>
    </body>
</html>


