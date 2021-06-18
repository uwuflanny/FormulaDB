using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace FormulaDB_GUI
{
    /// <summary>
    /// Logica di interazione per AddRiepilogo.xaml
    /// </summary>
    public partial class AddRiepilogo : Window
    {
        public AddRiepilogo()
        {
            InitializeComponent();
            dg_campionato.ItemsSource = (queryExecutor.executeReader("select * from campionato")).DefaultView;
            cmb_stato.Items.Add("END");
            cmb_stato.Items.Add("DNS");
            cmb_stato.Items.Add("DNF");
        }

        private void Dg_campionato_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            string idCampionato = (dg_campionato.SelectedItem as DataRowView).Row.ItemArray[0].ToString();
            dg_gare.ItemsSource = (queryExecutor.executeReader("select * from info_gara where campionato = "+idCampionato)).DefaultView;
            dg_piloti.ItemsSource = null;
        }

        private void Dg_gare_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dg_gare.SelectedIndex == -1) return;

            string idGara = (dg_gare.SelectedItem as DataRowView).Row.ItemArray[0].ToString();
            // riempio con i piloti che non hanno partecipato ancora a quella gara
            dg_piloti.ItemsSource = (queryExecutor.executeReader("select * from pilota where pilota.sigla not in (select Riepilogo.pilota as numero FROM riepilogo where gara = " + idGara+")")).DefaultView;


            this.fill_positions();


            int nGiri = int.Parse((dg_gare.SelectedItem as DataRowView).Row.ItemArray[2].ToString());
            lst_giri.Items.Clear();
            for(int i = 0; i< nGiri; i++) { lst_giri.Items.Add(new TextBox()); }
            foreach(var items in lst_giri.Items) { (items as TextBox).Width = 150; }
        }

        

        private void Dg_piloti_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dg_piloti.SelectedIndex == -1) return;

            string idPilota = (dg_piloti.SelectedItem as DataRowView).Row.ItemArray[1].ToString();
            dg_scuderie.ItemsSource = (queryExecutor.executeReader("select * from scuderia")).DefaultView;
            string scudContratto = (queryExecutor.executeReader("select ID_scuderia from Contratto_pilota where ID_pilota = '"+idPilota+"'")).DefaultView.Table.Rows[0][0].ToString();
            foreach(var item in dg_scuderie.Items)
            {
                if((item as DataRowView).Row.ItemArray[0].ToString() == scudContratto)
                {
                    dg_scuderie.SelectedItem = item;
                    break;
                }
            }
        }

        private void Btninsert_Click(object sender, RoutedEventArgs e)
        {
            if(dg_gare.SelectedIndex == -1 || dg_piloti.SelectedIndex == -1 || dg_scuderie.SelectedIndex == -1 || dg_campionato.SelectedIndex == -1
                || cmb_poiszione_gara.SelectedIndex == -1 || cmb_risultati_qualifica.SelectedIndex == -1 || cmb_stato.SelectedIndex == -1)
            {
                MessageBox.Show("input error");
                return;
            }
            foreach(var item in lst_giri.Items)
            {
                if (item.ToString() == "")
                {
                    MessageBox.Show("input errato");
                    return;
                }
            }

            string campionato = (dg_campionato.SelectedItem as DataRowView).Row.ItemArray[0].ToString();
            string pilota = (dg_piloti.SelectedItem as DataRowView).Row.ItemArray[1].ToString();
            string scuderia = (dg_scuderie.SelectedItem as DataRowView).Row.ItemArray[0].ToString();

            string query_riepologo = "insert into riepilogo(gara, pilota, scuderia) values(xx, 'yy', 'zz');";
            queryExecutor.executeEmpty(query_riepologo.Replace("xx", campionato).Replace("yy", pilota).Replace("zz", scuderia));

            this.fill_positions();
        }



        private void fill_positions()
        {
            string idGara = (dg_gare.SelectedItem as DataRowView).Row.ItemArray[0].ToString();
            // metto le posizioni ancora non occupate RISULTATI
            var resGara = (queryExecutor.executeReader("select posizione from risultati_gara where ID_riepilogo in (select ID as ID_riepilogo from riepilogo where gara = xx)".Replace("xx", idGara)));
            var resQual = (queryExecutor.executeReader("select posizione from risultati_qualifica where ID_riepilogo in (select ID as ID_riepilogo from riepilogo where gara = xx)".Replace("xx", idGara)));

            cmb_risultati_qualifica.Items.Clear();
            cmb_poiszione_gara.Items.Clear();

            List<int> posizioni = new List<int>();
            for (int i = 0; i < 20; i++) { posizioni.Add(i + 1); }
            foreach (DataRow row in resGara.Rows) { posizioni.Remove(int.Parse(row[0].ToString())); }
            foreach (int it in posizioni) cmb_poiszione_gara.Items.Add(it);

            posizioni = new List<int>();
            for (int i = 0; i < 20; i++) { posizioni.Add(i + 1); }
            foreach (DataRow row in resQual.Rows) { posizioni.Remove(int.Parse(row[0].ToString())); }
            foreach (int it in posizioni) cmb_risultati_qualifica.Items.Add(it);
        }





    }
}
