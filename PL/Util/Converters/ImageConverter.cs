﻿using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;
using System.Windows.Media.Imaging;

namespace CarDealership.Util
{
    public class ImageConverter : IValueConverter
    {
        public object Convert( object value, Type targetType, object parameter, CultureInfo culture)
        {
            object result = null;
            var path = value as string;

            if (!string.IsNullOrEmpty(path) && File.Exists(path))
            {
                using (FileStream stream = File.OpenRead(path))
                {
                    BitmapImage image = new BitmapImage();
                    image.BeginInit();
                    image.CacheOption = BitmapCacheOption.OnLoad;
                    image.StreamSource = stream;
                    image.EndInit();
                    result = image;
                }
            }

            return result;

        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}