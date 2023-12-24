using CarDealership.Util;
using CarDealership.ViewModels;
using Microsoft.Extensions.DependencyInjection;
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

namespace CarDealership.Views
{
    /// <summary>
    /// Логика взаимодействия для DealerInfoView.xaml
    /// </summary>
    public partial class DealerInfoView : Page
    {
        public DealerInfoView()
        {
            InitializeComponent();
            DataContext = StaticInjector.Host.Services.GetService<DealerInfoViewModel>();
        }
    }
}
