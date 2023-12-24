using System.Windows;
using CarDealership.Util;
using CarDealership.ViewModels;
using Microsoft.Extensions.DependencyInjection;


namespace CarDealership.Views
{
    /// <summary>
    /// Логика взаимодействия для MenuClientView.xaml
    /// </summary>
    public partial class MenuClientView : Window
    {
        public MenuClientView()
        {
            InitializeComponent();
            DataContext = StaticInjector.Host.Services.GetService<MenuClientViewModel>();

        }

    }
}
