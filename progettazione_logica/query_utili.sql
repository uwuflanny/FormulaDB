use formuladb;

/*
select * -- migliore giro per gara
from (
	select ID_riepilogo, gara, pilota ,scuderia ,min(tempo) as best
	from giro join riepilogo on riepilogo.ID = giro.ID_riepilogo
	group by gara, pilota
	order by gara, best ) as res
group by gara
*/

/*
select pilota, count(*) from -- quanti migliori giri ha fatto un pilota
(select * 
from (
	select ID_riepilogo, gara, pilota ,scuderia ,min(tempo) as best
	from giro join riepilogo on riepilogo.ID = giro.ID_riepilogo
	group by gara, pilota
	order by gara, best ) as res
group by gara ) as res2
group by pilota
*/


/*
-- classifica per ogni gara di un certo campionato
select gara, pilota, posizione, scuderia, circuito
from (riepilogo join info_gara on riepilogo.gara = info_gara.ID join risultati_gara on risultati_gara.ID_riepilogo = riepilogo.ID) 
where campionato = 1
order by gara, posizione 
*/



/* -- punteggi solo con le posizioni dalle gare
select pilota, sum(punteggio) as punteggio from (
	select gara, pilota, posizione as pos
	from (riepilogo join info_gara on riepilogo.gara = info_gara.ID join risultati_gara on risultati_gara.ID_riepilogo = riepilogo.ID)
	where campionato = 1) as res
    join punti_posizione on punti_posizione.posizione = res.pos
group by pilota
order by punteggio desc
*/



select res1.pilota, punteggio + IFNULL(girimigliori, 0) as punteggio from 

	(select pilota, sum(punteggio) as punteggio from (
		select gara, pilota, posizione as pos
		from (riepilogo join info_gara on riepilogo.gara = info_gara.ID join risultati_gara on risultati_gara.ID_riepilogo = riepilogo.ID)
		where campionato = 1) as res
		join punti_posizione on punti_posizione.posizione = res.pos
	group by pilota
	order by punteggio desc ) as res1
    
    left join 

	(select pilota, count(*) as girimigliori from -- quanti migliori giri ha fatto un pilota
		(select * 
		from (
			select ID_riepilogo, gara, pilota ,scuderia ,min(tempo) as best
			from giro join riepilogo on riepilogo.ID = giro.ID_riepilogo
			group by gara, pilota
			order by gara, best ) as res
		group by gara ) as res2
	group by pilota) as res2
    
    on res1.pilota = res2.pilota








