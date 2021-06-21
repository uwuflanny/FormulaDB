using System.Data;
using System.Windows;

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
            if (utility.checkAll(this as DependencyObject) == false)
            {
                MessageBox.Show("input errato");
                return;
            }
            string query = "insert into scuderia (nome, nazionalita) values ('xx', 'yy')";
            string nazione = (dgnazione.SelectedItem as DataRowView).Row.ItemArray[0].ToString();
            queryExecutor.executeEmpty(query.Replace("xx", txtnome.Text).Replace("yy", nazione));
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            utility.setDataGridReadOnly(this as DependencyObject);
        }
    }
}
