using System;
using System.Collections.Generic;
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
            string query = @"select circuito.nome, riepilogo.id, min(giro.tempo)
                            from circuito join info_gara on (circuito.nome = info_gara.circuito) join riepilogo on (info_gara.id = riepilogo.gara) join giro on (riepilogo.id = giro.ID_riepilogo)
                            group by circuito.nome";

            content.ItemsSource = queryExecutor.executeReader(query).DefaultView;
        }
    }
}
