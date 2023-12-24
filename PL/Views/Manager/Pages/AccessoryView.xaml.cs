using CarDealership.Util;
using CarDealership.ViewModels;
using Microsoft.Extensions.DependencyInjection;
using System.Windows.Controls;


namespace CarDealership.Views
{
    /// <summary>
    /// Логика взаимодействия для AccessoryView.xaml
    /// </summary>
    public partial class AccessoryView : Page
    {
        public AccessoryView()
        {
            InitializeComponent();
            DataContext = StaticInjector.Host.Services.GetService<AccessoryViewModel>();
        }
    }
}
