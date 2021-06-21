
███████╗ █████╗ ██████╗ ███╗   ███╗██╗   ██╗██╗      █████╗ ██████╗ ██████╗
██╔════╝██╔══██╗██╔══██╗████╗ ████║██║   ██║██║     ██╔══██╗██╔══██╗██╔══██╗
█████╗  ██║  ██║██████╔╝██╔████╔██║██║   ██║██║     ███████║██║  ██║██████╦╝
██╔══╝  ██║  ██║██╔══██╗██║╚██╔╝██║██║   ██║██║     ██╔══██║██║  ██║██╔══██╗
██║     ╚█████╔╝██║  ██║██║ ╚═╝ ██║╚██████╔╝███████╗██║  ██║██████╔╝██████╦╝
╚═╝      ╚════╝ ╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════╝ ╚═════╝
 
 Benvenuto su FormulaDB!
 
 Prima di poter utilizzare l'applicazione Desktop e' necessario
 generare il database eseguendo lo script ddl_formulaDB.sql presente nella cartella `database creation`,
 L'applicativo dispone delle operazioni necessarie per popolare il database, oppure e' possibile
 inserire dati a partire dagli script sql presenti nella cartella citata precedentemente.
 Tali script richiedono l'esecizione seguendo l'ordine definito dal numero nel nome del file.
 
 Prima di poter eseguire query mediante l'interfaccia utente e' necessario specificare il proprio username
 e la propria password all'interno del file user.txt, presente nella cartella `FormulaDB - Release`, nel formato:
 user=<il tuo username>
 password=<la tua password>
 
 Il codice dell'applicazione e' reperibile all'interno della cartella `FormulaDB - Codice`.
 Nella cartella sono presenti, con i nomi `MainWindow.xaml.cs` e `MainWindow.xaml` i file relativi al codice della schermata
 principale dell'applicativo ed il relativo linguaggio di Markup.
 Il file `queryExecutor.cs` definisce le due metodologie con le quali l'applicazione si interfaccia al Database.
 Il file `utility.cs` contiene funzioni di controllo globali utili a tutte le finestre del programma. 
 All' interno della sottocartella `finestre` sono presenti i codici relativi alle schermate di interazione con il DBMS.
 
 