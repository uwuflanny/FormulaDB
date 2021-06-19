using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Drawing;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Drawing;
using System.IO;
using FormulaDB_GUI.finestre;

namespace FormulaDB_GUI
{
    /// <summary>
    /// Logica di interazione per MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            this.load_buttons();
        }

        private void load_buttons()
        {
            btn_insert.IsEnabled = false;
            cnv_storico.Visibility = Visibility.Hidden;
            btn_insert.Click += switch_button;
            btn_history.Click += switch_button;
        }



        private void switch_button(object sender, RoutedEventArgs e)
        {
            (sender as Button).IsEnabled = false;
            if(sender as Button == btn_insert)
            {
                cnv_insert.Visibility = Visibility.Visible;
                cnv_storico.Visibility = Visibility.Hidden;
                btn_history.IsEnabled = true;
            }
            else
            {
                cnv_storico.Visibility = Visibility.Visible;
                cnv_insert.Visibility = Visibility.Hidden;
                btn_insert.IsEnabled = true;
            }
        }








        private void add_cammpionato_click(object sender, RoutedEventArgs e)
        {
            new AddCampionato().Show();
        }

        private void Btn_new_gara_Click(object sender, RoutedEventArgs e)
        {
            new AddGara().Show();
        }

        private void Btn_new_riepilogo_Click(object sender, RoutedEventArgs e)
        {
            new AddRiepilogo().Show();
        }

        private void Btn_new_macchina_Click(object sender, RoutedEventArgs e)
        {
            new AddMacchina().Show();
        }

        private void Btn_new_pilota_Click(object sender, RoutedEventArgs e)
        {
            new AddPilota().Show();
        }

        private void Btn_newscuderia_Click(object sender, RoutedEventArgs e)
        {
            new AddScuderia().Show();
        }

        private void Btn_nuovo_motore_Click(object sender, RoutedEventArgs e)
        {
            new AddMotore().Show();
        }

        private void Risultaticampionato_Click(object sender, RoutedEventArgs e)
        {
            new GetCampionatoData().Show();
        }
    }
}
