using FormulaDB_GUI.finestre;
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

namespace FormulaDB_GUI
{
    /// <summary>
    /// Logica di interazione per AddMacchina.xaml
    /// </summary>
    public partial class AddMacchina : Window
    {
        public AddMacchina()
        {
            InitializeComponent();
            dgcampionato.ItemsSource = (queryExecutor.executeReader("select * from campionato")).DefaultView;
            dgmotore.ItemsSource = (queryExecutor.executeReader("select * from motore")).DefaultView;
            dgscuderia.ItemsSource = (queryExecutor.executeReader("select * from scuderia")).DefaultView;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (utility.checkAll(this as DependencyObject) == false)
            {
                MessageBox.Show("input errato");
                return;
            }
            string query = "insert into macchina (ID_scuderia, ID_campionato, nome, motore) values ('xx', yy, 'zz', 'kk')";
            string scuderia = (dgscuderia.SelectedItem as DataRowView).Row.ItemArray[0].ToString();
            string campionato = (dgcampionato.SelectedItem as DataRowView).Row.ItemArray[0].ToString();
            string motore = (dgmotore.SelectedItem as DataRowView).Row.ItemArray[0].ToString();

            queryExecutor.executeEmpty(query.Replace("xx", scuderia).Replace("yy", campionato).Replace("zz", txtnome.Text).Replace("kk", motore));
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            utility.setDataGridReadOnly(this as DependencyObject);
        }
    }
}
