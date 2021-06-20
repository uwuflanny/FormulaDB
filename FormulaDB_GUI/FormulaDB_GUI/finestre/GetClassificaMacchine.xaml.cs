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
    /// Logica di interazione per GetClassificaMacchine.xaml
    /// </summary>
    public partial class GetClassificaMacchine : Window
    {
        public GetClassificaMacchine()
        {
            InitializeComponent();
            dg_campionato.ItemsSource = (queryExecutor.executeReader("select distinct classe from campionato")).DefaultView;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            utility.setDataGridReadOnly(this as DependencyObject);
        }

        private void Dg_campionato_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            string query = @"select scuderia, sum(bestlaps) as girimigliori, nome, motore, peso, lunghezza, larghezza from (
	                            select scuderia, count(*) as bestlaps, campionato  from (
		                            select * from(
			                            select ID_riepilogo, gara, pilota ,scuderia ,min(tempo) as best, campionato
			                            from giro join riepilogo on riepilogo.ID = giro.ID_riepilogo join info_gara on info_gara.ID = riepilogo.gara join campionato on campionato.ID = info_gara.campionato
			                            where campionato.classe = 'xx'
                                        group by gara, pilota
                                        order by gara, best ) as res
                                    group by gara ) as res
                                group by scuderia ) as res
                                join macchina on macchina.ID_scuderia = res.scuderia and macchina.ID_campionato = res.campionato
                                group by nome
                                order by bestlaps desc";

            query = query.Replace("xx", (dg_campionato.SelectedItem as DataRowView).Row.ItemArray[0].ToString());
            dg_res.ItemsSource = (queryExecutor.executeReader(query)).DefaultView;
        }
    }
}
