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
    /// Logica di interazione per winCount.xaml
    /// </summary>
    public partial class getWinner : Window
    {
        public getWinner()
        {
            InitializeComponent();
            string query = @"select riepilogo.pilota, count(*) as vittorie
                            from riepilogo join Risultati_gara on Riepilogo.ID = risultati_gara.ID_riepilogo
                            where risultati_gara.stato = 'END' and risultati_gara.posizione = 1
                            group by riepilogo.pilota
                            order by vittorie desc";

            dg_winner.ItemsSource = queryExecutor.executeReader(query).DefaultView;
        }
    }
}
