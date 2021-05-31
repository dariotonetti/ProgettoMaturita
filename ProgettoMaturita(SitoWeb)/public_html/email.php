<?php
$userEmail = $_POST['email'];
$message = '
    <html>
        <head>
            <title>Benvenuto</title>
        </head>
        <body>
            <h1>Benvenuto sul sito</h1>
            <p>La registrazione è stata effettuata con successo.</p>
        </body>
    </html>
';
$headers[] = 'MIME-Version: 1.0';
$headers[] = 'Content-type: text/html; charset=UTF-8';
if(mail('$userEmail', 'Richiesta Volantino', '$message', '$headers')){
    echo "Messaggio inviato con successo";
}else{
    echo"Errore: Messaggio non inviato";
}
?>