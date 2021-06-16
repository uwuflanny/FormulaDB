use formuladb;


-- campionato
insert into campionato (anno, classe) values (2020, "Formula 1");



-- circuito
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
insert into circuito (lunghezza, nome, nazione, citta) value (7004, "Spa-Francorchamps", "Belgio", "Terme");
insert into circuito (lunghezza, nome, nazione, citta) value (5303, "Albert Park F1", "Australia", "Melbourne");
insert into circuito (lunghezza, nome, nazione, citta) value (5451, "circuito internazionale di Shanghai", "Cina", "Shanghai");
insert into circuito (lunghezza, nome, nazione, citta) value (4252, "circuito Zandvoort", "Paesi Bassi", "Zandvoort");
insert into circuito (lunghezza, nome, nazione, citta) value (5554, "circuito di Yas Marina", "Turchia", "Abu Dhabi");



-- TODO tabella nazione

-- piloti
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
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (11, "PER", "Messico", "1990-01-26", "Sergio", "Perez");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (18, "STR", "Canada", "1998-10-29", "Lance", "Stroll");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (7, "RAI", "Finlandia", "1979-10-17", "Kimi", "Raikkonen");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (99, "GIO", "Italia", "1993-12-14", "Antonio", "Giovinazzi");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (8, "GRO", "Francia", "1986-04-17", "Romain", "Grosjean");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (20, "MAG", "Danimarca", "1992-10-05", "Kevin", "Magnussen");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (63, "RUS", "Regno Unito", "1998-02-15", "George", "Russell");
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (6, "LAT", "Canada", "1995-06-29", "Nicholas", "Latifi");



-- scuderia
insert into scuderia (nome, nazionalita) values ("Mercedes", "Germania");
insert into scuderia (nome, nazionalita) values ("Ferrari", "Italia");
insert into scuderia (nome, nazionalita) values ("Red Bull", "Austria");
insert into scuderia (nome, nazionalita) values ("Renault", "Francia");
insert into scuderia (nome, nazionalita) values ("Haas", "Stati Uniti");
insert into scuderia (nome, nazionalita) values ("McLaren", "Regno Unito");
insert into scuderia (nome, nazionalita) values ("Racing Point", "Regno Unito");
insert into scuderia (nome, nazionalita) values ("Alfa Romeo", "Svizzera");
insert into scuderia (nome, nazionalita) values ("AlphaTauri", "Italia");
insert into scuderia (nome, nazionalita) values ("Williams", "Regno Unito");



-- contratti scuderia pilota
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("BOT", "Mercedes", "2018-06-25", null );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("HAM", "Mercedes", "2017-10-21", 3 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("VET", "Ferrari", "2016-07-16", null );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("LEC", "Ferrari", "2016-11-02", 2 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("RAI", "Alfa Romeo", "2017-10-16", 1 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("GIO", "Alfa Romeo", "2016-08-02", 3 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("NOR", "McLaren", "2018-10-16", null );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("SAI", "McLaren", "2017-07-17", 5 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("VER", "Red Bull", "2017-06-16", 4 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("ALB", "Red Bull", "2016-10-07", 2 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("STR", "Racing Point", "2018-08-08", null );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("PER", "Racing Point", "2016-10-16", 5 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("RIC", "Renault", "2017-07-14", null );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("OCO", "Renault", "2016-10-16", 5 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("RUS", "WilliPMs", "2018-08-05", 2 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("LAT", "WilliPMs", "2016-06-11", null );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("GAS", "AlphaTauri", "2017-10-16", 2 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("KVY", "AlphaTauri", "2018-08-21", 1 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("GRO", "Haas", "2016-11-10", 1 );
insert into contratto_pilota (ID_pilota, ID_scuderia, data_inizio, durata_anni) values ("MAG", "Haas", "2017-10-04", null );



-- motori
insert into motore (nome, produttore, cavalli, alimentazione) values ("065 1.6 V6 turbo", "Ferrari", 930, "ibrido");
insert into motore (nome, produttore, cavalli, alimentazione) values ("M11 EQ Performance V6 turbo", "Mercedes", 1022, "ibrido");
insert into motore (nome, produttore, cavalli, alimentazione) values ("RA620H, V6 1.6 a 90° Turbo", "Red Bull", 740, "ibrido");
insert into motore (nome, produttore, cavalli, alimentazione) values ("E-TECH 20, V6 1.6 turbo", "Renault", 780, "ibrido");

-- TODO MACCHINE


-- info_gara
insert into info_gara (data_gara, n_giri, meteo, circuito) values ("2020-07-05 15-10-00", 60, "sole", "anello Red Bull");
insert into info_gara (data_gara, n_giri, meteo, circuito) values ("2020-07-12 15-10-00", 60, "pioggia", "anello Red Bull");
insert into info_gara (data_gara, n_giri, meteo, circuito) values ("2020-07-19 15-10-00", 60, "sole", "Hungaroring");
insert into info_gara (data_gara, n_giri, meteo, circuito) values ("2020-08-02 15-10-00", 60, "sole", "circuito di Silverstone F1");
insert into info_gara (data_gara, n_giri, meteo, circuito) values ("2020-08-09 15-10-00", 60, "nuvoloso", "circuito di Silverstone F1");
insert into info_gara (data_gara, n_giri, meteo, circuito) values ("2020-08-16 15-10-00", 60, "sole", "circuito di Catalunya");
insert into info_gara (data_gara, n_giri, meteo, circuito) values ("2020-08-30 15-10-00", 60, "nuvoloso", "Spa-Francorchamps");
insert into info_gara (data_gara, n_giri, meteo, circuito) values ("2020-09-06 15-10-00", 60, "sole", "Autodromo Nazionale Monza");
insert into info_gara (data_gara, n_giri, meteo, circuito) values ("2020-09-13 15-10-00", 60, "pioggia", "Mugello");
insert into info_gara (data_gara, n_giri, meteo, circuito) values ("2020-09-27 13-10-00", 60, "sole", "circuito di Sochi F1 Street");
insert into info_gara (data_gara, n_giri, meteo, circuito) values ("2020-10-11 14-10-00", 60, "pioggia", "Nürburgring");
insert into info_gara (data_gara, n_giri, meteo, circuito) values ("2020-11-01 14-10-00", 60, "sole", "circuito di Portimão");  -- forse data sbagliata ref https-//wheels.iconmagazine.it/sport/formula1/calendario-f1-2020-date-orari-gp#1gpaustriaredbullring5luglio2020
insert into info_gara (data_gara, n_giri, meteo, circuito) values ("2020-11-15 13-10-00", 60, "nuvoloso", "Autodromo E. & D. Ferrari");
insert into info_gara (data_gara, n_giri, meteo, circuito) values ("2020-11-29 11-10-00", 60, "sole", "circuito internazionale del Bahrain");
insert into info_gara (data_gara, n_giri, meteo, circuito) values ("2020-12-06 16-10-00", 60, "sole", "circuito internazionale del Bahrain");
insert into info_gara (data_gara, n_giri, meteo, circuito) values ("2020-12-13 18-10-00", 60, "nuvoloso", "circuito internazionale del Bahrain");
insert into info_gara (data_gara, n_giri, meteo, circuito) values ("2020-11-29 14-10-00", 60, "sole", "circuito di Yas Marina");



-- ingegneri
insert into ingegnere (CF, specialita, nazionalita, nascita, nome, cognome) values ("fASEVSETFGHH", "spoiler", "Italia", "", "", "", "");
insert into ingegnere (CF, specialita, nazionalita, nascita, nome, cognome) values ("RBYSDRBYDRSD", "motore", "Italia", "", "", "", "");
insert into ingegnere (CF, specialita, nazionalita, nascita, nome, cognome) values ("BSDRYBDRBCKY", "minigonne", "Italia", "", "", "", "");
insert into ingegnere (CF, specialita, nazionalita, nascita, nome, cognome) values ("EOJKGFSKLERG", "ruote", "", "Belgio", "", "", "");
insert into ingegnere (CF, specialita, nazionalita, nascita, nome, cognome) values ("RGMSEPJKGWES", "spoiler", "Stati Uniti", "", "", "", "");
insert into ingegnere (CF, specialita, nazionalita, nascita, nome, cognome) values ("IOGJROIRHGES", "motore", "Francia", "", "", "", "");
insert into ingegnere (CF, specialita, nazionalita, nascita, nome, cognome) values ("LSGKLEMGPKSM", "ruote", "Regno Unito", "", "", "", "");
insert into ingegnere (CF, specialita, nazionalita, nascita, nome, cognome) values ("GOKSRGOKASRG", "spoiler", "Regno Unito", "", "", "", "");
insert into ingegnere (CF, specialita, nazionalita, nascita, nome, cognome) values ("KRGMHALKRHNM", "motore", "Francia", "", "", "", "");
insert into ingegnere (CF, specialita, nazionalita, nascita, nome, cognome) values ("EKGJPAOSJFOF", "minigonne", "Turchia", "", "", "", "");
insert into ingegnere (CF, specialita, nazionalita, nascita, nome, cognome) values ("GGPWIOEGMJWG", "spoiler", "Regno Unito", "", "", "", "");
insert into ingegnere (CF, specialita, nazionalita, nascita, nome, cognome) values ("OCFWOPEGMIOW", "motore", "Francia", "", "", "", "");
insert into ingegnere (CF, specialita, nazionalita, nascita, nome, cognome) values ("FOAEKOPFKPOK", "ruote", "Turchia", "", "", "", "");
insert into ingegnere (CF, specialita, nazionalita, nascita, nome, cognome) values ("NEOFNEJONJEB", "motore", "Regno Unito", "", "", "", "");
insert into ingegnere (CF, specialita, nazionalita, nascita, nome, cognome) values ("OPAOJPEJIJFI", "minigonne", "Turchia", "", "", "", "");


