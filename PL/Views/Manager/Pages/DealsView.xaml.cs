using CarDealership.Util;
using CarDealership.ViewModels.Manager;
using Microsoft.Extensions.DependencyInjection;
using System.Windows.Controls;


namespace CarDealership.Views
{
    /// <summary>
    /// Логика взаимодействия для OrdersView.xaml
    /// </summary>
    public partial class DealsView : Page
    {
        public DealsView()
        {
            InitializeComponent();
            DataContext = StaticInjector.Host.Services.GetService<DealViewModel>();
        }
    }
}
