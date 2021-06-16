-- *********************************************
-- * Standard SQL generation                   
-- *--------------------------------------------
-- * DB-MAIN version: 11.0.1              
-- * Generator date: Dec  4 2018              
-- * Generation date: Sun Jun 13 12:21:58 2021 
-- * LUN file: C:\Users\N3KO\Desktop\FormulaDB\Formula DB.lun 
-- * Schema: Formula 1/SQL1 
-- ********************************************* 


-- Database Section
-- ________________ 

DROP database FormulaDB;
create database FormulaDB;
use FormulaDB;


-- DBSpace Section
-- _______________


-- Tables Section
-- _____________ 

create table Campionato (
     ID 			int 		not null auto_increment,
     anno 			int 		not null,
     Classe 		varchar(20) not null,
	 constraint ID_CAMPIONATO_ID primary key (ID)
);

create table Circuito (
     ID 			int		 	not null auto_increment,
     lunghezza  	int 		not null,
     nome 			varchar(60) not null,
     nazione 		varchar(60) not null,
     citta	 		varchar(60) not null,
     constraint ID_CIRCUITO_ID primary key (ID)
);

create table Contratto (
	 CF 			varchar(40) not null,
	 ID_scuderia 	int		 	not null,
     constraint ID_CONTRATTO_ID primary key (ID_scuderia, CF)
);

create table Giro (     
	 numero 		int		 	not null,
	 tempo 			time	    not null,
	 ID_riepilogo 	int		 	not null,
     constraint ID_GIRO_ID primary key (ID_riepilogo, numero)
);

create table Info_gara (
     ID 			int		 	not null auto_increment,
     data_gara 		datetime	not null,
     n_giri 		int		 	not null,
     meteo 			varchar(20) not null,
     circuito 		int		 	not null,
     constraint ID_Info_gara_ID primary key (ID)
);

create table Ingegnere (
     CF 			varchar(40) not null,
     specialita 	varchar(20) not null,
	 nazionalita 	varchar(20) not null,
	 nascita 		date 		not null,
	 nome 			varchar(20) not null,
	 cognome 		varchar(40) not null,
     constraint ID_Ingegnere_ID primary key (CF)
);

create table Pilota (
	 numero			int		 	not null, -- il numero del pilota  
	 sigla 			varchar(3) 	not null,
	 nazionalita 	varchar(20) not null,
	 nascita 		date		not null,
	 nome 			varchar(20) not null,
	 cognome 		varchar(40) not null,
     constraint ID_Pilota_ID primary key (sigla)
);

create table Motore (
	nome 			varchar(20) not null,
	produttore		int 		not null,
	cavalli 		int 		not null,
	alimentazione 	varchar(20) not null,
	constraint ID_Motore_ID primary key (nome)
);

create table Macchina (
     ID_scuderia 	int 		not null,
     ID_campionato 	int 		not null,
     nome 			varchar(20) not null,
     motore 		varchar(20) not null,
     peso 			int,
     lunghezza 		int,
     larghezza 		int,  
     constraint ID_Macchina_ID primary key (ID_scuderia, ID_campionato)
);

create table Pit_stop (
	 numero 		int		 	not null,
	 durata 		time		not null,
	 ID_riepilogo 	int		 	not null,
     constraint ID_Pit_stop_ID primary key (ID_riepilogo, numero)
);

create table Contratto_pilota (
	ID_pilota 		varchar(3) 	not null,
	ID_scuderia		int		 	not null,
	data_inizio		date	 	not null,
	durata_anni		int,
	constraint ID_Contratto_ID primary key(ID_pilota, ID_scuderia, data_inizio)
);

create table Riepilogo (
     ID 			int		 	not null auto_increment,
	 gara 			int		 	not null,
     pilota 		varchar(3) 	not null,
     campionato 	int		 	not null,
	 scuderia 		int		 	not null,
	 constraint ID_Riepilogo_ID primary key(ID)
);

create table Risultati_gara (
	ID_riepilogo 	int		 	not null,
	posizione 		int		 	not null,
	stato 			varchar(10) not null,
	constraint ID_Risultati_gara_ID primary key (ID_riepilogo)
);

create table Risultati_qualifica (   
	 ID_riepilogo 	int		 	not null, 
     posizione 		int		 	not null,
     tempo 			varchar(20) not null, 
     constraint ID_Risultati_qualifica_ID primary key (ID_riepilogo)
);


create table Scuderia (
     ID 			int		 	not null auto_increment,
     nome 			varchar(20) not null,
     nazionalita 	varchar(20) not null,
     constraint ID_Scuderia_ID primary key (ID)
);




-- Constraints Section
-- ___________________ 

alter table Contratto_pilota add constraint FK_Contratto_Pilota_ID
	foreign key(ID_pilota)
	references Pilota(sigla);
	
alter table Contratto_pilota add constraint FK_Contratto_Scuderia_Pilota_ID
	foreign key(ID_scuderia)
	references Scuderia(ID);

alter table Risultati_gara add constraint FK_Riep_gara_ID
	foreign key(ID_riepilogo)
	references Riepilogo(ID);

alter table Contratto add constraint FK_Ingnegnere_ID
	foreign key (CF)
	references Ingegnere (CF);
	
alter table Contratto add constraint FK_Scuderia_ID
	foreign key (ID_scuderia)
	references Scuderia (ID);

alter table Giro add constraint FK_Giro_riepilogo_ID
	foreign key (ID_riepilogo)
	references Riepilogo(ID);

alter table Info_gara add constraint FK_Circuito_ID
	 foreign key (circuito)
	 references Circuito(ID);

alter table Macchina add constraint FK_ID_scuderia_ID
	foreign key (ID_scuderia)
	references Scuderia(ID);
	
alter table Macchina add constraint FK_Campionato_ID
	foreign key (ID_campionato)
	references Campionato(ID);

alter table Pit_stop add constraint FK_Pit_riepilogo_ID
	foreign key(ID_riepilogo)
	references Riepilogo(ID);

alter table Riepilogo add constraint FK_pilota_ID
	foreign key(pilota)
	references Pilota(sigla);
	
alter table Riepilogo add constraint FK_gara_ID
	foreign key(gara)
	references Info_gara(ID);
	
alter table Riepilogo add constraint FK_Riep_campionato_ID
	foreign key(campionato)
	references Campionato(ID);
	
alter table Riepilogo add constraint FK_Riep_scuderia_ID
	foreign key(scuderia)
	references Scuderia(ID);
	
alter table Risultati_qualifica add constraint FK_Qual_riepilogo_ID
	foreign key(ID_riepilogo)
	references Riepilogo(ID);
	
alter table Macchina add constraint FK_Macchina_Motore_ID
	foreign key(motore)
	references Motore(nome);

alter table Motore add constraint FK_Produttore_ID
	foreign key(produttore)
	references Scuderia(ID);
	
-- Index Section
-- _____________ 


create unique index ID_Contratto_Pilota_IND
	on Contratto_pilota(ID_pilota, ID_scuderia, data_inizio);

create index FK_ID_Pilota_IND
	on Contratto_pilota(ID_pilota);
	
create index FK_ID_Scuderia_Pilota_IND
	on Contratto_pilota(ID_scuderia);
	
create unique index ID_Risultati_gara_IND
	on Risultati_gara(ID_riepilogo);
	
create index FK_Risultati_gara_IND
	on Risultati_gara(ID_riepilogo);

create unique index ID_Motore_IND
	on Motore(nome);
	
create index FK_Produttore_IND
	on Motore(produttore);
	
create index FK_Motore_IND
	on Macchina(motore);

create unique index ID_Campionato_IND
     on Campionato (ID);

create unique index ID_Circuito_IND
     on Circuito (ID);
	 
create unique index ID_Contratto_IND
     on Contratto (CF, ID_scuderia);
	 
create index FK_CF_IND
     on Contratto (CF);
	 
create index FK_ID_scuderia_IND
     on Contratto (ID_scuderia);

create unique index ID_Giro_IND
     on Giro (ID_riepilogo, numero);

create index FK_ID_riepilogo_IND
     on Giro (ID_riepilogo);

create unique index ID_Info_gara_IND
     on Info_gara (ID);
	 
create index FK_circuito_IND
     on Info_gara (circuito);
	 
create unique index ID_Ingegnere_IND
     on Ingegnere (CF);

create unique index ID_Pilota_IND
     on Pilota (sigla);

create unique index ID_Macchina_IND
     on Macchina (ID_scuderia, ID_campionato);

create index FK_ID_scuderia_IND
     on Macchina (ID_scuderia);
	 
create index FK_ID_campionato_IND
     on Macchina (ID_campionato);
	 
create unique index ID_Pit_stop_IND
     on Pit_stop (ID_riepilogo, numero);
	 
create index FK_ID_riepilogo_IND
     on Pit_stop (ID_riepilogo);

create unique index ID_Riepilogo_IND
     on Riepilogo (ID);

create index FK_gara_IND
     on Riepilogo (gara);
	 
create index FK_pilota_IND
     on Riepilogo (pilota);

create index FK_campionato_IND
     on Riepilogo (campionato);
	
create index FK_scuderia_IND
     on Riepilogo (scuderia);
	 
create unique index ID_Risultati_qualifica_IND
     on Risultati_qualifica (ID_riepilogo);
	 
create index FK_ID_riepilogo_IND
     on Risultati_qualifica (ID_riepilogo);
	 
create unique index ID_Scuderia_IND
     on Scuderia (ID);
	 
