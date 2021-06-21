using System.Windows;

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

            string query = @"select riepilogo.pilota, nome, cognome, numero, count(*) as vittorie
                            from riepilogo join Risultati_gara on Riepilogo.ID = risultati_gara.ID_riepilogo join pilota on pilota.sigla = riepilogo.pilota
                            where risultati_gara.stato = 'END' and risultati_gara.posizione = 1
                            group by riepilogo.pilota
                            order by vittorie desc";

            dg_winner.ItemsSource = queryExecutor.executeReader(query).DefaultView;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            utility.setDataGridReadOnly(this as DependencyObject);
        }
    }
}
