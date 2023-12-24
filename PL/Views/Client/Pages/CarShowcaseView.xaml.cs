using System.Windows.Controls;
using CarDealership.Util;
using CarDealership.ViewModels;
using Microsoft.Extensions.DependencyInjection;


namespace CarDealership.Views
{
    /// <summary>
    /// Логика взаимодействия для CarShowcaseView.xaml
    /// </summary>
    public partial class CarShowcaseView : Page
    {
        public CarShowcaseView()
        {
            InitializeComponent();
            DataContext = StaticInjector.Host.Services.GetService<CarShowcaseViewModel>();
        }
    }
}
