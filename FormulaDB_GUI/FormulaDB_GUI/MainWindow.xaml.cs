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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.IO;
using System.Net;

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

        private void Window_Loaded(object sender, RoutedEventArgs e)
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
            for (int i = 1; i<341; i++)
            {
                int ngiri = laps[corsa].Value;
                for (int k = 1; k < ngiri + 1; k++)
                {
                    string minutes = best[laps[corsa].Key].Hours.ToString();
                    string seconds = rnd.Next(best[laps[(i - 1) % 17].Key].Minutes, best[laps[(i - 1) % 17].Key].Minutes + 2).ToString();
                    string time = "00:0" + minutes + ":" + (seconds.Count() == 1 ? "0"+seconds : seconds) +"."+ rnd.Next(0, 10000000);


                    sw.WriteLine(query.Replace("xx", k.ToString()).Replace("yy", time).Replace("zz", i.ToString()));
                }
                if (i % 20 == 0) corsa++;
            }
            sw.Close();
        }
    }
}
