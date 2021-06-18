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

namespace FormulaDB_GUI
{
    /// <summary>
    /// Logica di interazione per AddCampionato.xaml
    /// </summary>
    public partial class AddCampionato : Window
    {
        public AddCampionato()
        {
            InitializeComponent();   
        }

        private void Btn_insert_Click(object sender, RoutedEventArgs e)
        {
            if(txt_anno.Text=="" || txt_classe.Text == "")
            {
                MessageBox.Show("dati incorretti");
                return;
            }
            string query = "insert into campionato (anno, classe) values (xx, 'yy')";
            queryExecutor.executeEmpty(query.Replace("xx", txt_anno.Text).Replace("yy", txt_classe.Text));
        }
    }
}
