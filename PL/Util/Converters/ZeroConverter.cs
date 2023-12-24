using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace CarDealership.Util
{
    public class ZeroConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is int intVal)
            {
                if (intVal <= 0) {  return " "; }
                
            }
            else if (value is long longVal)
            {
                if (longVal <= 0) { return " "; }

            }
            else if (value is float floatVal)
            {
                if (floatVal <= 0) { return " "; }

            }
            else if (value is double doubleVal)
            {
                if (doubleVal <= 0) { return " "; }

            }
            return value;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return value;
        }
    }
}
