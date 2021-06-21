using System.Windows;

namespace FormulaDB_GUI.finestre
{
    /// <summary>
    /// Logica di interazione per GetBestGiri.xaml
    /// </summary>
    public partial class GetBestGiri : Window
    {
        public GetBestGiri()
        {
            InitializeComponent();       
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            utility.setDataGridReadOnly(this as DependencyObject);
            string query = @"select circuito.nome, min(giro.tempo) as 'miglior tempo'
                            from circuito join info_gara on (circuito.nome = info_gara.circuito) join riepilogo on (info_gara.id = riepilogo.gara) join giro on (riepilogo.id = giro.ID_riepilogo)
                            group by circuito.nome";

            content.ItemsSource = queryExecutor.executeReader(query).DefaultView;
        }
    }
}
