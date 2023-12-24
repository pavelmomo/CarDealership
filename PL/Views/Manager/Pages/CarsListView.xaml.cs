using CarDealership.Util;
using System.Windows.Controls;
using Microsoft.Extensions.DependencyInjection;
using CarDealership.ViewModels;

namespace CarDealership.Views
{
    /// <summary>
    /// Логика взаимодействия для CarsListView.xaml
    /// </summary>
    public partial class CarsListView : Page
    {
        public CarsListView()
        {
            InitializeComponent();
            DataContext = StaticInjector.Host.Services.GetService<CarsListViewModel>();
        }
    }
}
