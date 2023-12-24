using CarDealership.Util;
using CarDealership.ViewModels;
using Microsoft.Extensions.DependencyInjection;
using System.Windows;

namespace CarDealership.Views
{
    /// <summary>
    /// Логика взаимодействия для MenuManagerView.xaml
    /// </summary>
    public partial class MenuManagerView : Window
    {
        public MenuManagerView()
        {
            InitializeComponent();
            DataContext = StaticInjector.Host.Services.GetService<MenuManagerViewModel>();
        }
    }
}
