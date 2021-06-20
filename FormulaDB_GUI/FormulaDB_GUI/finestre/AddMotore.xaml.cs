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
    /// Logica di interazione per AddMotore.xaml
    /// </summary>
    public partial class AddMotore : Window
    {
        public AddMotore()
        {
            InitializeComponent();
            dgscuderie.ItemsSource = (queryExecutor.executeReader("select * from scuderia")).DefaultView;
        }

        private void Btn_add_motore_Click(object sender, RoutedEventArgs e)
        {
            if (utility.checkAll(this as DependencyObject) == false)
            {
                MessageBox.Show("input errato");
                return;
            }
            string query = "insert into motore (nome, produttore, cavalli, alimentazione) values ('xx', 'yy', zz, 'kk')";
            string scuderia = (dgscuderie.SelectedItem as DataRowView).Row.ItemArray[0].ToString();
            queryExecutor.executeEmpty(query.Replace("xx", txtnome.Text).Replace("yy", scuderia).Replace("zz", txtcavalli.Text).Replace("kk", txtalimentazione.Text));
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            utility.setDataGridReadOnly(this as DependencyObject);
        }
    }
}
