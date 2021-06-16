use formuladb;


-- campionati
delete from campionato;
insert into campionato (anno, classe) values (2020, "Formula 1");



-- scuderia
delete from scuderia;
insert into scuderia (nome, nazionalita) values ("Mercedes", "Germania");
insert into scuderia (nome, nazionalita) values ("Ferrari", "Italia");
insert into scuderia (nome, nazionalita) values ("Red Bull", "Austria");
insert into scuderia (nome, nazionalita) values ("Renault", "Francia");
insert into scuderia (nome, nazionalita) values ("Haas", "United States");
insert into scuderia (nome, nazionalita) values ("McLaren", "United Kingdom");
insert into scuderia (nome, nazionalita) values ("Racing Point", "United Kingdom");
insert into scuderia (nome, nazionalita) values ("Alfa Romeo", "Svizzera");
insert into scuderia (nome, nazionalita) values ("AlphaTauri", "Italia");
insert into scuderia (nome, nazionalita) values ("Williams", "United Kingdom");



-- circuito
delete from circuito;
insert into circuito (lunghezza, nome, nazione, citta) value (4381, "Hungaroring", "Ungheria", "Mogyorod");
insert into circuito (lunghezza, nome, nazione, citta) value (5807, "Suzuka F1", "Giappone", "Nagoya");
insert into circuito (lunghezza, nome, nazione, citta) value (5513, "circuito delle Americhe", "Stati Uniti d'America", "Austin");
insert into circuito (lunghezza, nome, nazione, citta) value (3337, "circuito di Monaco", "Monte Carlo", "Monaco");
insert into circuito (lunghezza, nome, nazione, citta) value (4361, "circuito Gilles Villeneuve", "Canada", "Montreal");
insert into circuito (lunghezza, nome, nazione, citta) value (4318, "anello Red Bull", "Austria", "Spielberg");
insert into circuito (lunghezza, nome, nazione, citta) value (4933, "Autodromo E. & D. Ferrari", "Italia", "Imola");
insert into circuito (lunghezza, nome, nazione, citta) value (5793, "Autodromo Nazionale Monza", "Italia", "Monza");
insert into circuito (lunghezza, nome, nazione, citta) value (5412, "circuito internazionale del Bahrain", "Bahrain", "Sakhir");
insert into circuito (lunghezza, nome, nazione, citta) value (5245, "Mugello", "Italia", "Mugello");
insert into circuito (lunghezza, nome, nazione, citta) value (4655, "circuito di Catalunya", "Spagna", "Barcellona");
insert into circuito (lunghezza, nome, nazione, citta) value (4653, "circuito di Portimão", "Portogallo", "Portimão");
insert into circuito (lunghezza, nome, nazione, citta) value (5848, "circuito di Sochi F1 Street", "Russia", "Soci");
insert into circuito (lunghezza, nome, nazione, citta) value (6003, "circuito di Baku Street", "Azerbaigian", "Baku");
insert into circuito (lunghezza, nome, nazione, citta) value (5148, "Nürburgring", "Germania", "Nürburg");
insert into circuito (lunghezza, nome, nazione, citta) value (5891, "circuito di Silverstone F1", "Gran Bretagna", "Silverstone");
insert into circuito (lunghezza, nome, nazione, citta) value (7004, "Spa-Francorchamps", "terme", "Belgio");
insert into circuito (lunghezza, nome, nazione, citta) value (5303, "Albert Park F1", "Australia", "Melbourne");
insert into circuito (lunghezza, nome, nazione, citta) value (5451, "circuito internazionale di Shanghai", "Cina", "Shanghai");
insert into circuito (lunghezza, nome, nazione, citta) value (4252, "circuito Zandvoort", "The Netherlands", "Zandvoort");



-- piloti
delete from pilota;
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (16, "LEC", "Monaco", "1997-10-16", "Charles", "Leclerc");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (5, "VET", "Germania", "1987-07-03", "Sebastian", "Vettel");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (77, "BOT", "Finlandia", "1989-08-28", "Valtteri", "Bottas");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (44, "HAM", "Regno Unito", "1985-01-07", "Lewis", "Hamilton");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (33, "VER", "Paesi Bassi", "1997-09-30", "Max", "Verstappen");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (23, "ALB", "Thailandia", "1996-03-23", "Alexander", "Albon");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (55, "SAI", "Spagna", "1994-09-01", "Carlos", "Sainz");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (4, "NOR", "Regno Unito", "1999-11-13", "Lando", "Norris");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (3, "RIC", "Australia", "1989-07-01", "Daniel", "Ricciardo");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (31, "OCO", "Francia", "1996-09-17", "Esteban", "Ocon");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (26, "KVY", "Russia", "1994-04-26", "Daniil", "Kvjat");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (10, "GAS", "Francia", "1996-02-07", "Pierre", "Gasly");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (11, "PER", "Messico", "1990-01-26", "Sergio", "PÃ©rez");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (18, "STR", "Canada", "1998-10-29", "Lance", "Stroll");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (7, "RAI", "Finlandia", "1979-10-17", "Kimi", "Raikkonen");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (99, "GIO", "Italia", "1993-12-14", "Antonio", "Giovinazzi");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (8, "GRO", "Francia", "1986-04-17", "Romain", "Grosjean");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (20, "MAG", "Danimarca", "1992-10-05", "Kevin", "Magnussen");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (63, "RUS", "Regno Unito", "1998-02-15", "George", "Russell");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (6, "LAT", "Canada", "1995-06-29", "Nicholas", "Latifi");



-- contratti scuderia pilota
delete from contratto_pilota;
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("BOT", 1, "2018-06-25", null );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("HAM", 1, "2017-10-21", 3 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("VET", 2, "2016-07-16", null );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("LEC", 2, "2016-11-02", 2 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("RAI", 8, "2017-10-16", 1 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("GIO", 8, "2016-08-02", 3 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("NOR", 6, "2018-10-16", null );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("SAI", 6, "2017-07-17", 5 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("VER", 3, "2017-06-16", 4 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("ALB", 3, "2016-10-07", 2 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("STR", 7, "2018-08-08", null );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("PER", 7, "2016-10-16", 5 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("RIC", 4, "2017-07-14", null );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("OCO", 4, "2016-10-16", 5 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("RUS", 10, "2018-08-05", 2 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("LAT", 10, "2016-06-11", null );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("GAS", 9, "2017-10-16", 2 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("KVY", 9, "2018-08-21", 1 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("GRO", 5, "2016-11-10", 1 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("MAG", 5, "2017-10-04", null );











