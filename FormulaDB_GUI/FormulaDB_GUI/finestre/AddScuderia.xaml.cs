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
    /// Logica di interazione per AddScuderia.xaml
    /// </summary>
    public partial class AddScuderia : Window
    {
        public AddScuderia()
        {
            InitializeComponent();
            dgnazione.ItemsSource = (queryExecutor.executeReader("select * from nazione")).DefaultView;
        }

        private void Btninsert_Click(object sender, RoutedEventArgs e)
        {
            string query = "insert into scuderia (nome, nazionalita) values ('xx', 'yy')";
            string nazione = (dgnazione.SelectedItem as DataRowView).Row.ItemArray[0].ToString();
            queryExecutor.executeEmpty(query.Replace("xx", txtnome.Text).Replace("yy", nazione));
        }
    }
}
