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

namespace FormulaDB_GUI.finestre
{
    /// <summary>
    /// Logica di interazione per AddPilota.xaml
    /// </summary>
    public partial class AddPilota : Window
    {
        public AddPilota()
        {
            InitializeComponent();
            dg_nazioni.ItemsSource = (queryExecutor.executeReader("select * from nazione")).DefaultView;
            dgcuderie.ItemsSource = (queryExecutor.executeReader("select * from scuderia")).DefaultView;
        }

        private void Btninsert_Click(object sender, RoutedEventArgs e)
        {
            if (utility.checkAll(this as DependencyObject) == false)
            {
                MessageBox.Show("input errato");
                return;
            }
            string query = "insert into pilota (numero, sigla, nazionalita, nascita, nome, cognome) value (xx, 'yy', 'zz', 'kk', 'll', 'qq');";
            string naz = (dg_nazioni.SelectedItem as DataRowView).Row.ItemArray[0].ToString();
            string date = dgnascita.SelectedDate.ToString();
            var dt = DateTime.ParseExact(date, "dd/MM/yyyy hh:mm:ss", CultureInfo.InvariantCulture);
            string final = dt.ToString("yyyy-MM-dd");
            queryExecutor.executeEmpty(query.Replace("xx", txtnumero.Text).Replace("yy", txtsigla.Text).Replace("zz", naz).Replace("kk", final).Replace("ll", txtnome.Text).Replace("qq", txtcognome.Text));

            string scuderia = (dgcuderie.SelectedItem as DataRowView).Row.ItemArray[0].ToString();
            string queryContratto = "insert into contratto_pilota(ID_pilota, ID_scuderia, data_inizio) values('xx', 'yy', 'zz');";
            var dtt = DateTime.ParseExact(dcontratto.SelectedDate.ToString(), "dd/MM/yyyy hh:mm:ss", CultureInfo.InvariantCulture);
            string finalt = dtt.ToString("yyyy-MM-dd");
            queryExecutor.executeEmpty(queryContratto.Replace("xx", txtsigla.Text).Replace("yy", scuderia).Replace("zz", finalt));
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            utility.setDataGridReadOnly(this as DependencyObject);
        }
    }
}
