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
    /// Logica di interazione per AddCircuito.xaml
    /// </summary>
    public partial class AddCircuito : Window
    {
        public AddCircuito()
        {
            InitializeComponent();
            dgnazione.ItemsSource = (queryExecutor.executeReader("select * from nazione")).DefaultView;
        }

        private void Btninsert_Click(object sender, RoutedEventArgs e)
        {
            if (utility.checkAll(this as DependencyObject) == false)
            {
                MessageBox.Show("input errato");
                return;
            }

            string nazione = (dgnazione.SelectedItem as DataRowView).Row.ItemArray[0].ToString();
            string query = "insert into circuito (lunghezza, nome, nazione, citta) values (xx, 'yy', 'uu', 'kk')";
            queryExecutor.executeReader(query.Replace("xx", txtlung.Text).Replace("yy", txtnome.Text).Replace("uu", nazione).Replace("kk", txtcitta.Text));
        }
    }
}
