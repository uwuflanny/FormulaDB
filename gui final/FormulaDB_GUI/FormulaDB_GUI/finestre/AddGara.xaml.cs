using FormulaDB_GUI.finestre;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
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

namespace FormulaDB_GUI
{
    /// <summary>
    /// Logica di interazione per AddGara.xaml
    /// </summary>
    public partial class AddGara : Window
    {
        public AddGara()
        {
            InitializeComponent();
            dg_campionato.ItemsSource   = (queryExecutor.executeReader("select * from campionato")).DefaultView;
            dg_circuito.ItemsSource     = (queryExecutor.executeReader("select * from circuito")).DefaultView;
            cmbmeteo.Items.Add("nuvoloso");
            cmbmeteo.Items.Add("sole");
            cmbmeteo.Items.Add("pioggia");
        }

        private void Btn_add_gara_Click(object sender, RoutedEventArgs e)
        {
            if (utility.checkAll(this as DependencyObject) == false)
            {
                MessageBox.Show("input errato");
                return;
            }

            string query        = "insert into info_gara (data_gara, n_giri, meteo, circuito, campionato) values ('xx', yy, 'zz', 'kk', ll)";
            string circuito     = (dg_circuito.SelectedItem as DataRowView).Row.ItemArray[1].ToString();
            string campionato   = (dg_campionato.SelectedItem as DataRowView).Row.ItemArray[0].ToString();
            string date = datepicker.SelectedDate.ToString();

            var dt = DateTime.ParseExact(date, "dd/MM/yyyy hh:mm:ss", CultureInfo.InvariantCulture);
            string final = dt.ToString("yyyy-MM-dd hh-mm-ss");

            query = query.Replace("xx", final).Replace("yy", txtgiri.Text).Replace("zz", cmbmeteo.SelectedItem.ToString()).Replace("ll", campionato).Replace("kk", circuito);
            queryExecutor.executeEmpty(query);
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            utility.setDataGridReadOnly(this as DependencyObject);
        }
    }
}
