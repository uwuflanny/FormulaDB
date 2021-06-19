using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

namespace FormulaDB_GUI
{
    class queryExecutor
    {


        static string conn = "server=localhost;userid=utonto;password=zeb89acegamer;database=formuladb";


        public static void executeEmpty(string query)
        {
            MySqlConnection mysqlconnection = new MySqlConnection(conn);
            mysqlconnection.Open();
            MySqlCommand cmd = mysqlconnection.CreateCommand();
            cmd.CommandText = query;

            try
            {
                int affected = cmd.ExecuteNonQuery();
            }
            catch(Exception e)
            {
                MessageBox.Show(e.Message);
            }

            cmd.Dispose();
            mysqlconnection.Close();
        }


        public static System.Data.DataTable executeReader(string query)
        {
            MySqlConnection mysqlconnection = new MySqlConnection(conn);
            mysqlconnection.Open();
            MySqlCommand cmd = mysqlconnection.CreateCommand();
            cmd.CommandText = query;
            System.Data.DataTable dt = new DataTable("Query Result");

            try
            {
                MySqlDataReader reader = cmd.ExecuteReader();        
                dt.Load(reader);
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                cmd.Dispose();
                mysqlconnection.Close();
                return null;
            }
            
            cmd.Dispose();
            mysqlconnection.Close();
            return dt;
        }
    }
}
