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

create database Formula 1;


-- DBSpace Section
-- _______________


-- Tables Section
-- _____________ 

create table Campionato (
     ID numeric(4) not null,
     anno numeric(5) not null,
     Classe varchar(20) not null,
	 primary key (ID)
);

create table Circuito (
     ID numeric(4) not null,
     nome varchar(20) not null,
     nazione varchar(20) not null,
     indirizzo varchar(20) not null,
     primary key (ID)
);

create table contratto (
	 CF varchar(40) 		foreign key references Persona(CF),
	 ID_scuderia numeric(4) foreign key references Scuderia(ID),
     primary key (ID_scuderia, CF)
);

create table Giro (     
	 numero numeric(3) not null,
	 tempo varchar(20) not null,
	 ID_riepilogo numeric(4) foreign key references Riepilogo(ID),
     primary key (ID_riepilogo, numero)
);

create table Info_gara (
     ID numeric(4) not null,
     data_gara date not null,
     n_giri numeric(3) not null,
     meteo varchar(20) not null,
     circuito numeric(4) foreign key references Circuito(ID),
     primary key (ID)
);

-- TODO
create table Ingegnere (
     CF varchar(40) not null,
     specializzazione varchar(20) not null,
     constraint FKPer_Ing_ID primary key (CF)
);

create table Macchina (
     ID_scuderia numeric(4) foreign key references Scuderia(ID),
     ID_campionato char(1)  foreign key references Campionato(ID),
     nome varchar(20) not null,
     motore varchar(20) not null,
     cavalli numeric(5) not null,
     peso numeric(4),
     lunghezza numeric(5),
     larghezza numeric(5),
     alimentazione varchar(20) not null,
     primary key (ID_scuderia, ID_campionato)
);

-- TODO
create table Persona (
     nome varchar(20) not null,
     nazionalita_ varchar(20) not null,
     nascita date not null,
     CF varchar(40) not null,
     constraint ID_Persona_ID primary key (CF));

-- TODO
create table Pilota (
     ID numeric(4) not null,
     CF varchar(40) not null,
     numero varchar(2) not null,
     sigla varchar(5) not null,
     constraint ID_Pilota_ID primary key (ID),
     constraint FKPer_Pil_ID unique (CF));

create table Pit_stop (
	 numero numeric(3) not null,
	 durata varchar(20) not null,
	 ID_riepilogo numeric(4) foreign key references Riepilogo(ID),
     primary key (ID_riepilogo, numero)
);

create table Riepilogo (
     ID numeric(4) not null,
     top_giro varchar(20) not null, -- TODO constraint
     status varchar(10) not null,
     posizione numeric(2) not null,
	 gara numeric(4) 		foreign key references Info_gara(ID),
     pilota numeric(4) 		foreign key references Pilota(ID),
     campionato numeric(4) 	foreign key references Campionato(ID),
	 scuderia numeric(4) 	foreign key references Scuderia(ID),
	 primary key(ID)
);

create table Risultati_qualifica (    
     posizione numeric(2) not null,
     taglio numeric(1) not null,
     tempo varchar(20) not null,
	 ID_riepilogo numeric(4) foreign key references Riepilogo(ID),
     primary key (ID_riepilogo)
);

create table Scuderia (
     ID numeric(4) not null,
     nome varchar(20) not null,
     nazionalita varchar(20) not null,
     primary key (ID)
);


-- Constraints Section
-- ___________________ 

alter table Campionato add constraint ID_Campionato_CHK
     check(exists(select * from Riepilogo
                  where Riepilogo.Com_ID = ID)); 

alter table contratto add constraint FKcon_Scu
     foreign key (ID)
     references Scuderia;

alter table contratto add constraint FKcon_Ing_FK
     foreign key (CF)
     references Ingegnere;

alter table Giro add constraint REF_Giro_Riepi
     foreign key (ID_riepilogo)
     references Riepilogo;

alter table Giro add constraint FKpercorre_FK
     foreign key (ID)
     references Riepilogo;

alter table Info_gara add constraint ID_Info_gara_CHK
     check(exists(select * from Riepilogo
                  where Riepilogo.Ass_ID = ID)); 

alter table Info_gara add constraint FKcorre_FK
     foreign key (Cor_ID)
     references Circuito;

alter table Ingegnere add constraint FKPer_Ing_FK
     foreign key (CF)
     references Persona;

alter table Macchina add constraint REF_Macch_Scude
     foreign key (ID_scuderia)
     references Scuderia;

alter table Macchina add constraint REF_Macch_Campi_FK
     foreign key (ID_campionato)
     references Campionato;

alter table Macchina add constraint FKpossiede_FK
     foreign key (ID)
     references Scuderia;

alter table Pilota add constraint FKPer_Pil_FK
     foreign key (CF)
     references Persona;

alter table Pit_stop add constraint REF_Pit_s_Riepi
     foreign key (ID_riepilogo)
     references Riepilogo;

alter table Pit_stop add constraint FKeffettua_FK
     foreign key (ID)
     references Riepilogo;

alter table Riepilogo add constraint REF_Riepi_Info__FK
     foreign key (ID_gara)
     references Info_gara;

alter table Riepilogo add constraint REF_Riepi_Pilot_FK
     foreign key (ID_pilota)
     references Pilota;

alter table Riepilogo add constraint REF_Riepi_Campi_FK
     foreign key (ID_campionato)
     references Campionato;

alter table Riepilogo add constraint FKpartecipa_FK
     foreign key (Par_ID)
     references Scuderia;

alter table Riepilogo add constraint FKgareggia_FK
     foreign key (Gar_ID)
     references Pilota;

alter table Riepilogo add constraint FKdetermina_FK
     foreign key (ID_riepilogo)
     references Risultati_qualifica;

alter table Riepilogo add constraint FKcompone_FK
     foreign key (Com_ID)
     references Campionato;

alter table Riepilogo add constraint FKassocia_FK
     foreign key (Ass_ID)
     references Info_gara;

alter table Risultati_qualifica add constraint REF_Risul_Riepi_FK
     foreign key (ID_riepilogo)
     references Riepilogo;

alter table Risultati_qualifica add constraint ID_Risultati_qualifica_CHK
     check(exists(select * from Riepilogo
                  where Riepilogo.ID_riepilogo = ID_riepilogo)); 

alter table Scuderia add constraint ID_Scuderia_CHK
     check(exists(select * from contratto
                  where contratto.ID = ID)); 

alter table Scuderia add constraint ID_Scuderia_CHK
     check(exists(select * from Riepilogo
                  where Riepilogo.Par_ID = ID)); 

alter table Scuderia add constraint ID_Scuderia_CHK
     check(exists(select * from Macchina
                  where Macchina.ID = ID)); 


-- Index Section
-- _____________ 

create unique index ID_Campionato_IND
     on Campionato (ID);

create unique index ID_Circuito_IND
     on Circuito (ID);

create unique index ID_contratto_IND
     on contratto (ID, CF);

create index FKcon_Ing_IND
     on contratto (CF);

create unique index ID_Giro_IND
     on Giro (ID_riepilogo, numero);

create index FKpercorre_IND
     on Giro (ID);

create unique index ID_Info_gara_IND
     on Info_gara (ID);

create index FKcorre_IND
     on Info_gara (Cor_ID);

create unique index FKPer_Ing_IND
     on Ingegnere (CF);

create index REF_Macch_Campi_IND
     on Macchina (ID_campionato);

create unique index ID_Macchina_IND
     on Macchina (ID_scuderia, ID_campionato);

create index FKpossiede_IND
     on Macchina (ID);

create unique index ID_Persona_IND
     on Persona (CF);

create unique index ID_Pilota_IND
     on Pilota (ID);

create unique index FKPer_Pil_IND
     on Pilota (CF);

create unique index ID_Pit_stop_IND
     on Pit_stop (ID_riepilogo, numero);

create index FKeffettua_IND
     on Pit_stop (ID);

create index REF_Riepi_Info__IND
     on Riepilogo (ID_gara);

create index REF_Riepi_Pilot_IND
     on Riepilogo (ID_pilota);

create index REF_Riepi_Campi_IND
     on Riepilogo (ID_campionato);

create unique index ID_Riepilogo_IND
     on Riepilogo (ID);

create index FKpartecipa_IND
     on Riepilogo (Par_ID);

create index FKgareggia_IND
     on Riepilogo (Gar_ID);

create unique index FKdetermina_IND
     on Riepilogo (ID_riepilogo);

create index FKcompone_IND
     on Riepilogo (Com_ID);

create index FKassocia_IND
     on Riepilogo (Ass_ID);

create index REF_Risul_Riepi_IND
     on Risultati_qualifica (ID_riepilogo);

create unique index ID_Scuderia_IND
     on Scuderia (ID);

