# Gestione Gara

### Flutter App: Gestione Gara
### Autore: Tonetti Dario
***
>## Introduzione
Per la creazione di questo progetto ho utilizzato [Flutter](http://kodestat.gitbook.io/flutter/ "Flutter Tutorial"). Veniva richiesta la progettazione, tramite schema [UML](http://www.tutorialspoint.com/uml/index.htm "UML Tutorial"), e la programmazione tramite [Dart](https://dart.dev/tutorials "Dart Tutorial") di un'applicazione di gestione delle prenotazioni delle classi di una scuola.

# Progettazione
Per la progettazione dello schema UML ho utilizzato il software: Draw.io 

# Programmazione
Ho lavorato su due fronti quasi contemporanemante: la grafica e la parte funzionale. Ogni vola che creavo la parte funzionale, mi ritrovavo a creare un minimo di grafica per controllare il funzionamento corretto.

>## DataBase
Per salvare i dati delle classi (nome e tipo di gara) ho utilizzato un database interno all'applicazione denominato: [SQFLite](https://www.html.it/pag/397562/sqflite-come-gestire-un-db-sqlite-con-flutter/ "SQFLite Tutorial").
>## Classi Create + Funzionamento

>**Dbmanager.dart**

Classe utilizzata per la gestione del database. **Funzionalità :** Inizializzazione del DataBase, delle tabelle e degli attributi associati. Esecuzione delle Query necessarie alla modifica di uno o più attributi, inserimento di una nuova gara e cancellazione di una o più gare.

>**FormPage.dart** 

Creazione del form di Iscrizione ad una gara con controlli di validità su valori vuoti o nulli.

>**InputDeco_design.dart**

Creazione del design (Colori, tipi di pulsanti) del Form di Iscrizione.
***

>**Menu.dart**

Creazione di un Menu a tendina con possibilità di andare alla Home Page dell'applicazione e aggiungere o modificare una gara.
In questo File è presente anche il `Widget body(...)` dove viene creata la Home Page iniziale dell'applicazione. In questo Widget è presente l'elenco delle gare create con Nome della gara, Categoria, Data di inizio ed Orario di inizio. Per ogni gara creata sono presenti 4 pulsanti che permettono: **Iscrizione alla gara tramite Form di Iscrizione**, **annullamento iscrizione dalla gara specifica**, **modifica degli attributi della gara** e **cancellazione della gara specifica**.

>**Main.dart**

Creazione dell'applicazione con richiamo alla classe della pagina iniziale: `Menu()`.