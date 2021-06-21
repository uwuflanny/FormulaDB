-- aggiunta di un motore
select * from scuderia;
insert into motore (nome, produttore, cavalli, alimentazione) values ('?', '?', ?, '?');


-- aggiunta di una scuderia
select * from nazione;
insert into scuderia (nome, nazionalita) values ('?', '?');


-- aggiunta di un pilota
select * from nazione;
select * from scuderia;
insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (?, '?', '?', '?', '?', '?');
insert into contratto_pilota(ID_pilota, ID_scuderia, data_inizio) values('?', '?', '?', ?);


-- aggiunta di una macchina ad una scuderia
select * from campionato;
select * from motore;
select * from scuderia;
insert into macchina (ID_scuderia, ID_campionato, nome, motore) values ('?', ?, '?', '?')


-- aggiunta di un circuito
select * from nazione;
insert into circuito (lunghezza, nome, nazione, citta) values (?, '?', '?', '?')


-- aggiunta di un campionato
insert into campionato (anno, classe) values (?, '?');


-- aggiunta di una gara ad un campionato
select * from campionato;
select * from circuito;
insert into info_gara (data_gara, n_giri, meteo, circuito, campionato) values ('?', ?, '?', '?', ?)


-- aggiungere il riepilogo di un pilota
select * from campionato;
select * from info_gara where campionato = ?
	-- guardo quali piloti non hanno una entry nella gara scelta
select * from pilota where pilota.sigla not in (select Riepilogo.pilota as numero 
											    from riepilogo 
											    where gara = ?);
	-- prendo le posizione non occupate
select posizione from risultati_gara where ID_riepilogo in (select ID as ID_riepilogo from riepilogo where gara = ?)
select posizione from risultati_qualifica where ID_riepilogo in (select ID as ID_riepilogo from riepilogo where gara = ?)										
select * from scuderia;
select ID_scuderia from Contratto_pilota where ID_pilota = '?';
	-- inserisaco i dati
insert into riepilogo(gara, pilota, scuderia) values(?, '?', '?');
select max(ID) from Riepilogo -- si potrebbe anche LAST_INSERT_ID() nei campi ID_riepilogo
insert into Risultati_qualifica (ID_riepilogo, posizione, tempo) values (?, ?, '?')
insert into Risultati_gara (ID_riepilogo, posizione, stato) values (?, ?, '?')
insert into Pit_stop(numero, durata, ID_riepilogo) values(?, '?', ?)	-- da eseguire per ongi pit stop
insert into giro(numero, tempo, ID_riepilogo) values(?, '?', ?)			-- da eseguire per ogni giro
	
	
-- visualizzare la classifica dei piloti in un campionato
select res1.pilota, punteggio + IFNULL(girimigliori, 0) as punteggio from
	-- punti dati dalle posizioni in gara
	(select pilota, sum(punteggio) as punteggio from (
		select gara, pilota, posizione as pos
		from (riepilogo join info_gara on riepilogo.gara = info_gara.ID join risultati_gara on risultati_gara.ID_riepilogo = riepilogo.ID)
		where campionato = ?) as res
		join punti_posizione on punti_posizione.posizione = res.pos
	group by pilota
	order by punteggio desc ) as res1

	left join 
	-- punti dati dai giri migliori
	(select pilota, count(*) as girimigliori from 
		(select * 
		from (
			select ID_riepilogo, gara, pilota ,scuderia ,min(tempo) as best
			from giro join riepilogo on riepilogo.ID = giro.ID_riepilogo  join info_gara on info_gara.ID = riepilogo.gara
			where info_gara.campionato = ?
			group by gara, pilota
			order by gara, best ) as res
		group by gara ) as res2
	group by pilota) as res2

	on res1.pilota = res2.pilota

	
-- visualizzare la classifica delle autombili
select res1.scuderia, punteggio + IFNULL(girimigliori, 0) as punteggio from 
	-- punti dati dalle posizioni in gara
	( select scuderia, sum(punteggio) as punteggio
	from (riepilogo join info_gara on riepilogo.gara = info_gara.ID join risultati_gara on risultati_gara.ID_riepilogo = riepilogo.ID join punti_posizione on risultati_gara.posizione = punti_posizione.posizione)
	where campionato = ? 
	group by scuderia) as res1

	left join 
	-- punti dati dai giri migliori
	(select scuderia, count(*) as girimigliori from ( -- migliore giro per scuderia
		select *
		from (
			select ID_riepilogo, gara, pilota ,scuderia ,min(tempo) as best
			from giro join riepilogo on riepilogo.ID = giro.ID_riepilogo join info_gara on info_gara.ID = riepilogo.gara
			where info_gara.campionato = ?
			group by gara, pilota
			order by gara, best ) as res
		group by gara ) as res
	group by scuderia) as res2

	on res1.scuderia = res2.scuderia
	order by punteggio desc

	
-- visualizzare il numero di vittorie di ogni pilota
select riepilogo.pilota, nome, cognome, numero, count(*) as vittorie
from riepilogo join Risultati_gara on Riepilogo.ID = risultati_gara.ID_riepilogo join pilota on pilota.sigla = riepilogo.pilota
where risultati_gara.stato = 'END' and risultati_gara.posizione = 1
group by riepilogo.pilota
order by vittorie desc


-- ottenere la classifica dei veicoli piu' veloci per classe a partire dal numero di giri migliori fatti
select scuderia, sum(bestlaps) as girimigliori, nome, motore, peso, lunghezza, larghezza from (
	select scuderia, count(*) as bestlaps, campionato  from (
		select * from(
			select ID_riepilogo, gara, pilota ,scuderia ,min(tempo) as best, campionato
			from giro join riepilogo on riepilogo.ID = giro.ID_riepilogo join info_gara on info_gara.ID = riepilogo.gara join campionato on campionato.ID = info_gara.campionato
			where campionato.classe = '?'
			group by gara, pilota
			order by gara, best ) as res
		group by gara ) as res
	group by scuderia ) as res
	join macchina on macchina.ID_scuderia = res.scuderia and macchina.ID_campionato = res.campionato
	group by nome
	order by bestlaps desc
	
	
-- ottenere il giro piu' veloce di ogni circuito
select circuito.nome, min(giro.tempo) as 'miglior tempo'
	from circuito join info_gara on (circuito.nome = info_gara.circuito) join riepilogo on (info_gara.id = riepilogo.gara) join giro on (riepilogo.id = giro.ID_riepilogo)
	group by circuito.nome



