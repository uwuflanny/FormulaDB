using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace FormulaDB_GUI.finestre
{
    class utility
    {

        private static List<bool> getChildrenRec(DependencyObject root)
        {
            List<bool> checks = new List<bool>();
            if (root != null)
            {
                for (int i = 0; i < VisualTreeHelper.GetChildrenCount(root); i++)
                {
                    DependencyObject child = VisualTreeHelper.GetChild(root, i);

                    if (child.GetType() == typeof(TextBox) && (child as TextBox).Text == "") checks.Add(false);
                    if (child.GetType() == typeof(ComboBox) && (child as ComboBox).SelectedIndex == -1) checks.Add(false);
                    if (child.GetType() == typeof(DataGrid) && (child as DataGrid).SelectedIndex == -1) checks.Add(false);

                    checks.AddRange(getChildrenRec(child));
                }
            }
            return checks;
        }

        public static bool checkAll(DependencyObject root)
        {
            return !getChildrenRec(root as DependencyObject).Contains(false);
        }





        private static void setReadOnly(DependencyObject root){
            if (root != null)
            {
                for (int i = 0; i < VisualTreeHelper.GetChildrenCount(root); i++)
                {
                    DependencyObject child = VisualTreeHelper.GetChild(root, i);
                    if (child.GetType() == typeof(DataGrid))
                    {
                        (child as DataGrid).IsReadOnly = true;
                    }

                    setReadOnly(child);
                }
            }
        }

        public static void setDataGridReadOnly(DependencyObject root)
        {
            setReadOnly(root as DependencyObject);
        }



    }
}
