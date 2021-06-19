using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

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
        }

        private void dg_campionato_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dg_campionato.SelectedIndex == -1) return;

            string idCampionato = (dg_campionato.SelectedItem as DataRowView).Row.ItemArray[0].ToString();
            string query = @"select res1.pilota, punteggio + IFNULL(girimigliori, 0)*2 as punteggio from
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
			                            from giro join riepilogo on riepilogo.ID = giro.ID_riepilogo
			                            group by gara, pilota
			                            order by gara, best ) as res
		                            group by gara ) as res2
	                            group by pilota) as res2
    
                                on res1.pilota = res2.pilota";

            dg_res.ItemsSource = queryExecutor.executeReader(query.Replace("xx", idCampionato)).DefaultView;
        }
    }
}
