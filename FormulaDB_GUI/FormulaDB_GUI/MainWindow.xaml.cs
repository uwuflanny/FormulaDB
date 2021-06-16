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

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            using (StreamReader sr = new StreamReader("item.txt")) {
                string item = sr.ReadToEnd().Replace("<tr>", "").Replace("</tr>", "").Replace("<td>","x").Replace("</td>","x");
                string[] items = item.Split('x');
                foreach(string s in items)
                {
                    MessageBox.Show(s);
                }
            }
        }
    }
}
