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

        private void load_riepilogo()
        {
            Dictionary<string, string> cc = new Dictionary<string, string>();
            StreamReader sr = new StreamReader("item.txt");
            while (!sr.EndOfStream)
            {
                var line = sr.ReadLine().Split(',');
                cc.Add(line[0], line[1]);
            }
            sr.Close();

            StreamWriter sw = new StreamWriter("ddl_risultati.sql");
            string query = @"insert into riepilogo(gara, pilota, scuderia) values(xx, 'yy', 'zz');";
            for (int i = 1; i < 18; i++)
            {
                foreach (var entry in cc)
                {
                    sw.WriteLine(query.Replace("xx", i.ToString()).Replace("yy", entry.Key).Replace("zz", entry.Value));
                }
            }
            sw.Close();
        }
        private void load_giro()
        {
            List<KeyValuePair<string, int>> laps = new List<KeyValuePair<string, int>>();
            StreamReader sr = new StreamReader("item.txt");
            while (!sr.EndOfStream)
            {
                var line = sr.ReadLine().Split(',');
                laps.Add(new KeyValuePair<string, int>(line[3].ToUpper(), int.Parse(line[1])));
            }
            sr.Close();

            Dictionary<string, TimeSpan> best = new Dictionary<string, TimeSpan>();
            sr = new StreamReader("circuiti.txt");
            while (!sr.EndOfStream)
            {
                var line = sr.ReadLine().Split('"');
                best.Add(line[1].ToUpper(), TimeSpan.Parse(line[2].Trim()));
            }
            sr.Close();

            Random rnd = new Random();
            StreamWriter sw = new StreamWriter("dil_giro.sql");
            string query = @"insert into giro (numero, tempo, ID_riepilogo) values (xx, 'yy', zz);";
            int corsa = 0;
            for (int i = 1; i < 341; i++)
            {
                int ngiri = laps[corsa].Value;
                for (int k = 1; k < ngiri + 1; k++)
                {
                    string minutes = best[laps[corsa].Key].Hours.ToString();
                    string seconds = rnd.Next(best[laps[(i - 1) % 17].Key].Minutes, best[laps[(i - 1) % 17].Key].Minutes + 2).ToString();
                    string time = "00:0" + minutes + ":" + (seconds.Count() == 1 ? "0" + seconds : seconds) + "." + rnd.Next(0, 10000000);


                    sw.WriteLine(query.Replace("xx", k.ToString()).Replace("yy", time).Replace("zz", i.ToString()));
                }
                if (i % 20 == 0) corsa++;
            }
            sw.Close();
        }
        private void load_pitstop()
        {
            List<KeyValuePair<string, int>> laps = new List<KeyValuePair<string, int>>();
            StreamReader sr = new StreamReader("item.txt");
            while (!sr.EndOfStream)
            {
                var line = sr.ReadLine().Split(',');
                laps.Add(new KeyValuePair<string, int>(line[3].ToUpper(), int.Parse(line[1])));
            }
            sr.Close();

            Dictionary<string, TimeSpan> best = new Dictionary<string, TimeSpan>();
            sr = new StreamReader("circuiti.txt");
            while (!sr.EndOfStream)
            {
                var line = sr.ReadLine().Split('"');
                best.Add(line[1].ToUpper(), TimeSpan.Parse(line[2].Trim()));
            }
            sr.Close();

            Random rnd = new Random();
            StreamWriter sw = new StreamWriter("dil_pitstop.sql");
            string query = @"insert into Pit_stop (numero, durata, ID_riepilogo) values (xx, 'yy', zz);";
            int corsa = 0;
            for (int i = 1; i < 341; i++)
            {
                int numpitstop = rnd.Next(1, 4);
                for (int k = 1; k < numpitstop + 1; k++)
                {
                    string seconds = rnd.Next(2, 4).ToString();
                    string time = "00:0" + "0" + ":" + (seconds.Count() == 1 ? "0" + seconds : seconds) + "." + rnd.Next(0, 10000000);


                    sw.WriteLine(query.Replace("xx", k.ToString()).Replace("yy", time).Replace("zz", i.ToString()));
                }
                if (i % 20 == 0) corsa++;
            }
            sw.Close();
        }
        private void load_qualifiche()
        {
            List<KeyValuePair<string, int>> laps = new List<KeyValuePair<string, int>>();
            StreamReader sr = new StreamReader("item.txt");
            while (!sr.EndOfStream)
            {
                var line = sr.ReadLine().Split(',');
                laps.Add(new KeyValuePair<string, int>(line[3].ToUpper(), int.Parse(line[1])));
            }
            sr.Close();

            Dictionary<string, TimeSpan> best = new Dictionary<string, TimeSpan>();
            sr = new StreamReader("circuiti.txt");
            while (!sr.EndOfStream)
            {
                var line = sr.ReadLine().Split('"');
                best.Add(line[1].ToUpper(), TimeSpan.Parse(line[2].Trim()));
            }
            sr.Close();

            Random rnd = new Random();
            StreamWriter sw = new StreamWriter("dil_qualifica.sql");
            string query = @"insert into Pit_stop (ID_riepilogo, posizione, tempo) values (xx, yy, 'zz');";
            int idRiep = 1;

            List<int> order = new List<int>();
            for (int i = 1; i < 21; i++) order.Add(i);
            int corsa = 0;
            while (idRiep != 341)
            {

                List<string> times = new List<string>();
                for (int i = 0; i < 20; i++)
                {
                    string minutes = best[laps[corsa].Key].Hours.ToString();
                    string seconds = rnd.Next(best[laps[corsa].Key].Minutes, best[laps[corsa].Key].Minutes + 2).ToString();
                    string time = "00:0" + minutes + ":" + (seconds.Count() == 1 ? "0" + seconds : seconds) + "." + rnd.Next(0, 10000000);
                    times.Add(time);
                }
                times.Sort();
                this.randomize(order, times);


                for (int i = 0; i < 20; i++)
                {

                    sw.WriteLine(query.Replace("xx", idRiep.ToString()).Replace("yy", order[i].ToString()).Replace("zz", times[i]));
                    idRiep++;
                }
                corsa++;
            }

            sw.Close();
        }
        private void load_risultati()
        {
            List<KeyValuePair<string, int>> laps = new List<KeyValuePair<string, int>>();
            StreamReader sr = new StreamReader("item.txt");
            while (!sr.EndOfStream)
            {
                var line = sr.ReadLine().Split(',');
                laps.Add(new KeyValuePair<string, int>(line[3].ToUpper(), int.Parse(line[1])));
            }
            sr.Close();

            Dictionary<string, TimeSpan> best = new Dictionary<string, TimeSpan>();
            sr = new StreamReader("circuiti.txt");
            while (!sr.EndOfStream)
            {
                var line = sr.ReadLine().Split('"');
                best.Add(line[1].ToUpper(), TimeSpan.Parse(line[2].Trim()));
            }
            sr.Close();

            Random rnd = new Random();
            StreamWriter sw = new StreamWriter("dil_risultati.sql");
            StreamReader srg = new StreamReader("dil_giro.sql");

            string query = @"insert into Risultati_gara (ID_riepilogo, posizione, stato) values (xx, yy, 'zz');";
            int idRiep = 1;
            int corsa = 0;


            while (!srg.EndOfStream)
            {
                int ngiri = laps[corsa].Value;
                List<KeyValuePair<int, double>> times = new List<KeyValuePair<int, double>>();

                for (int pp = 1; pp < 21; pp++)
                {
                    double totaltime = 0;
                    for (int i = 0; i < ngiri; i++)
                    {
                        string asd = srg.ReadLine();

                        double millis = double.Parse(asd.Split('"')[1].Split('.')[1]);
                        millis = millis / 100000;

                        string time = asd.Split('"')[1];
                        time = time.Split('.')[0].Replace("00:", "");
                        TimeSpan sus = TimeSpan.Parse(time);
                        totaltime = sus.Hours * 60 + sus.Minutes + millis;
                    }

                    times.Add(new KeyValuePair<int, double>(pp, totaltime));


                }
                times = times.OrderBy(x => x.Value).ToList();

                for (int i = 0; i < 20; i++)
                {
                    sw.WriteLine(query.Replace("xx", idRiep.ToString()).Replace("yy", times[i].Key.ToString()).Replace("zz", "END"));
                    idRiep++;
                }



                corsa++;
            }
            sw.Close();
            srg.Close();
        }
        private void randomize(List<int> list, List<string> times)
        {
            Random rand = new Random();
            int n = list.Count;
            while (n > 1)
            {
                n--;
                int k = rand.Next(n + 1);
                int val = list[k];
                string time = times[k];
                times[k] = times[n];
                list[k] = list[n];
                times[n] = time;
                list[n] = val;
            }
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
    }
}
