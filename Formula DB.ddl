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


-- TODO: normalizzare macchina e motore



-- DBSpace Section
-- _______________


-- Tables Section
-- _____________ 

create table Campionato (
     ID 			numeric(4) 	not null,
     anno 			numeric(5) 	not null,
     Classe 		varchar(20) not null,
	 constraint ID_CAMPIONATO_ID primary key (ID)
);

create table Circuito (
     ID 			numeric(4) 	not null,
     nome 			varchar(20) not null,
     nazione 		varchar(20) not null,
     via	 		varchar(20) not null,
	 civico	 		numeric(10) not null,
	 cap	 		numeric(10) not null,
     constraint ID_CIRCUITO_ID primary key (ID)
);

create table Contratto (
	 CF 			varchar(40) not null,
	 ID_scuderia 	numeric(4) 	not null,
     constraint ID_CONTRATTO_ID primary key (ID_scuderia, CF)
);

create table Giro (     
	 numero 		numeric(3) 	not null,
	 tempo 			varchar(20) not null,
	 ID_riepilogo 	numeric(4) 	not null,
     constraint ID_GIRO_ID primary key (ID_riepilogo, numero)
);

create table Info_gara (
     ID 			numeric(4) 	not null,
     data_gara 		datetime	not null,
     n_giri 		numeric(3) 	not null,
     meteo 			varchar(20) not null,
     circuito 		numeric(4) 	not null,
     constraint ID_Info_gara_ID primary key (ID)
);

create table Ingegnere (
     CF 			varchar(40) not null,
     specialita 	varchar(20) not null,
	 nazionalita 	varchar(20) not null,
	 nascita 		datetime	not null,
	 nome 			varchar(20) not null,
	 cognome 		varchar(40) not null,
     constraint ID_Ingegnere_ID primary key (CF)
);

create table Pilota (
     ID 			numeric(4) 	not null, -- il numero del pilota
     sigla 			varchar(5) 	not null,
	 nazionalita 	varchar(20) not null,
	 nascita 		datetime	not null,
	 nome 			varchar(20) not null,
	 cognome 		varchar(40) not null,
     constraint ID_Pilota_ID primary key (ID)
);

create table Motore (
	ID 				numeric(4) 	not null,
	produttore		numeric(4) 	not null,
	nome 			varchar(20) not null,
	cavalli 		numeric(5) 	not null,
	alimentazione 	varchar(20) not null,
	constraint ID_Motore_ID primary key (ID)
);

create table Macchina (
     ID_scuderia 	numeric(4) 	not null,
     ID_campionato 	numeric(4) 	not null,
     nome 			varchar(20) not null,
     motore 		numeric(4) not null,
     peso 			numeric(4),
     lunghezza 		numeric(5),
     larghezza 		numeric(5),  
     constraint ID_Macchina_ID primary key (ID_scuderia, ID_campionato)
);

create table Pit_stop (
	 numero 		numeric(3) 	not null,
	 durata 		varchar(20) not null,
	 ID_riepilogo 	numeric(4) 	not null,
     constraint ID_Pit_stop_ID primary key (ID_riepilogo, numero)
);

create table Contratto_pilota (
	ID_pilota 		numeric(4) 	not null,
	ID_scuderia		numeric(4) 	not null,
	data_inizio		date	 	not null,
	durata_anni		numeric(5),
	constraint ID_Contratto_ID primary key(ID_pilota, ID_scuderia, data_inizio)
);

create table Riepilogo (
     ID 			numeric(4) 	not null,
	 gara 			numeric(4) 	not null,
     pilota 		numeric(4) 	not null,
     campionato 	numeric(4) 	not null,
	 scuderia 		numeric(4) 	not null,
	 constraint ID_Riepilogo_ID primary key(ID)
);

create table Risultati_gara (
	ID_riepilogo 	numeric(4) 	not null,
	posizione 		numeric(2) 	not null,
	stato 			varchar(10) not null,
	constraint ID_Risultati_gara_ID primary key (ID_riepilogo)
);

create table Risultati_qualifica (   
	 ID_riepilogo 	numeric(4) 	not null, 
     posizione 		numeric(2) 	not null,
     tempo 			varchar(20) not null, 
     constraint ID_Risultati_qualifica_ID primary key (ID_riepilogo)
);


create table Scuderia (
     ID 			numeric(4) 	not null,
     nome 			varchar(20) not null,
     nazionalita 	varchar(20) not null,
     constraint ID_Scuderia_ID primary key (ID)
);




-- Constraints Section
-- ___________________ 

alter table Contratto_pilota add constraint FK_Contratto_Pilota_ID
	foreign key(ID_pilota)
	references Pilota(ID);
	
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
	references Pilota(ID);
	
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
	references Motore(ID);

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
	on Motore(ID);
	
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
     on Pilota (ID);

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
	 
