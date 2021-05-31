<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Progetto Maturità | HomePage</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="grafica.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="titolo">
            <h2>MX PAPAVERA PARK</h2>
            <div class="btnConsole">
                <form action='console.html'>
                    <input type='submit' value='Console'>
                </form>
            </div>
        </div>
        <br>
        <div class="container">
            <!--Inserire parte php per creare i box dinamicamente-->
                        <?php
                        $info= new mysqli('localhost', 'root','', 'maturità');
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
                            <div class='box'>
                                <div class='details'>
                                    <b style='font-size:130%;'>${gara['nome_gara']}</b>
                                    <a href='info.php?gara=${gara['nome_gara']}'><input type='submit' value='Info'></a>
                                    <a href='iscriviti.php?gara=${gara['nome_gara']}'><input type='submit' value='Iscriviti'></a>
                                </div>
                            </div>
                            ";
                        }
                        ?>    
        </div>
        <br>
        <div class="volantino">
            <div class="titoloPar">
                Vuoi ricevere un volantino?
            </div>
                <form style="margin: 10px;" action="email.php" method="POST">
                    Email&nbsp&nbsp<input type="text" name="email" placeholder="Inserisci email...">&nbsp&nbsp
                    <input id="submit" type="submit" value="Invia">
                </form>
            <br>
        </div>
        <br>
        <div class="sponsor">
            <div class="titoloPar">
                Sponsor Ufficiali
            </div> 
                <div class="nomiSponsor">
                    <?php
                        $sponsor= new mysqli('localhost', 'root','', 'maturità');
                        /*------------------------------------------------------------------------------------------------------- /
                        if ($mysqli->connect_error) {
                            die('Errore di connessione(' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
                        } else {
                            echo 'Connesso. ' . $mysqli->host_info . "\n<br>";
                        }
                        / ------------------------------------------------------------------------------------------------------ */
                        $query = "SELECT * 
                                  FROM sponsor";
                        $result =  $sponsor->query($query);
                        while ($nomesponsor = $result->fetch_assoc()) {
                            echo "
                                <i style='color:black;' class='fa fa-motorcycle fa-2x' aria-hidden='true'></i><a href='#'><b style='color:black; font-size:20px;'>${nomesponsor['nome_sponsor']}</b></a>&nbsp&nbsp&nbsp&nbsp
                            ";
                        }
                        ?>
                </div>
        </div>
        <br>
        <div class="live">
            <div class="titoloPar">
                Guarda la classifica in Live
            </div>
            <div>
                <form style="margin:10px;" action="classifica.php">
                    <!--Inserire parte php per prendere gara e categoria-->
                    <?php
                        $live= new mysqli('localhost', 'root','', 'maturità');
                        /*------------------------------------------------------------------------------------------------------- /
                        if ($mysqli->connect_error) {
                            die('Errore di connessione(' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
                        } else {
                            echo 'Connesso. ' . $mysqli->host_info . "\n<br>";
                        }
                        / ------------------------------------------------------------------------------------------------------ */
                        $query = "SELECT * 
                                  FROM gara";
                        $result =  $live->query($query);
                        while ($gara = $result->fetch_assoc()) {
                            echo "
                            <p style='font-size:20px;'>${gara['nome_gara']}&nbsp/&nbsp${gara['categoria']}&nbsp&nbsp&nbsp&nbsp<a href='classifica.php?gara=${gara['nome_gara']}'><i style='color:red;' class='fa fa-play' aria-hidden='true'></i></a>
                            </p><br>
                            ";
                        }
                        ?>
                </form>
            </div>
        </div>
        <br>
        <div class="sicurezza">
            <form action='index.php'>
                <input id="privacy" type='submit' value="Privacy">
            </form>
            <form action='index.php'>
                <input id="privacy" type='submit' value="Termini su Sicurezza">
            </form>
        </div>
        <br>
        <div class="contatti">
            <div class="titoloPar">
                Contattaci
            </div>
            <div class="contattaci">
                <a href="#"><i style="color:purple;" class="fa fa-instagram fa-2x" aria-hidden="true"></i></a><b style="color:purple;">&nbsp&nbspInstagram</b>&nbsp&nbsp&nbsp&nbsp&nbsp
                <a href="#"><i style="color:green;" class="fa fa-whatsapp fa-2x" aria-hidden="true"></i></a><b style="color:green;">&nbsp&nbspWhatsApp</b>&nbsp&nbsp&nbsp&nbsp&nbsp
                <a href="#"><i style="color:blue;" class="fa fa-twitter-square fa-2x" aria-hidden="true"></i></a><b style="color:blue;">&nbsp&nbspTwitter</b>&nbsp&nbsp&nbsp&nbsp&nbsp
                <a href="#"><i style="color:red;" class="fa fa-envelope fa-2x" aria-hidden="true"></i></a><b style="color:red;">&nbsp&nbspEmail</b>&nbsp&nbsp&nbsp&nbsp&nbsp
            </div>
        </div>
    </body>
</html>


