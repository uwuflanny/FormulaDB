using System.Data;
using System.Windows;
using System.Windows.Controls;

namespace FormulaDB_GUI.finestre
{
    /// <summary>
    /// Logica di interazione per GetCampionatoData.xaml
    /// </summary>
    public partial class GetCampionatoData : Window
    {
        public GetCampionatoData()
        {
            InitializeComponent();

            dg_campionato.ItemsSource = (queryExecutor.executeReader("select * from campionato")).DefaultView;
            this.load_queries();
        }

        private void load_queries()
        {
            btn_piloti.Tag = @"select res1.pilota, punteggio + IFNULL(girimigliori, 0) as punteggio from
	                            (select pilota, sum(punteggio) as punteggio from (
		                            select gara, pilota, posizione as pos
		                            from (riepilogo join info_gara on riepilogo.gara = info_gara.ID join risultati_gara on risultati_gara.ID_riepilogo = riepilogo.ID)
		                            where campionato = xx) as res
		                            join punti_posizione on punti_posizione.posizione = res.pos
	                            group by pilota
	                            order by punteggio desc ) as res1
    
                                left join 

	                            (select pilota, count(*) as girimigliori from -- quanti migliori giri ha fatto un pilota
		                            (select * 
		                            from (
			                            select ID_riepilogo, gara, pilota ,scuderia ,min(tempo) as best
			                            from giro join riepilogo on riepilogo.ID = giro.ID_riepilogo  join info_gara on info_gara.ID = riepilogo.gara
                                        where info_gara.campionato = xx
			                            group by gara, pilota
			                            order by gara, best ) as res
		                            group by gara ) as res2
	                            group by pilota) as res2
    
                                on res1.pilota = res2.pilota";

            btn_scuderie.Tag = @"select res1.scuderia, punteggio + IFNULL(girimigliori, 0) as punteggio from 
	                            ( select scuderia, sum(punteggio) as punteggio
	                            from (riepilogo join info_gara on riepilogo.gara = info_gara.ID join risultati_gara on risultati_gara.ID_riepilogo = riepilogo.ID join punti_posizione on risultati_gara.posizione = punti_posizione.posizione)
	                            where campionato = xx 
	                            group by scuderia) as res1
    
                                left join 
    
                                (select scuderia, count(*) as girimigliori from ( -- migliore giro per scuderia
		                            select *
		                            from (
			                            select ID_riepilogo, gara, pilota ,scuderia ,min(tempo) as best
			                            from giro join riepilogo on riepilogo.ID = giro.ID_riepilogo join info_gara on info_gara.ID = riepilogo.gara
                                        where info_gara.campionato = xx
			                            group by gara, pilota
			                            order by gara, best ) as res
		                            group by gara ) as res
	                            group by scuderia) as res2
    
                                on res1.scuderia = res2.scuderia
	                            order by punteggio desc";
        }

        private void execute(string query)
        {
            if (dg_campionato.SelectedIndex == -1) return;
            string idCampionato = (dg_campionato.SelectedItem as DataRowView).Row.ItemArray[0].ToString();
            dg_res.ItemsSource = queryExecutor.executeReader(query.Replace("xx", idCampionato)).DefaultView;
        }

        private void btn_press(object sender, RoutedEventArgs e)
        {
            this.execute((sender as Button).Tag.ToString());
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            utility.setDataGridReadOnly(this as DependencyObject);
        }
    }
}
