using CarDealership.Util;
using CarDealership.ViewModels;
using CarDealership.ViewModels.Manager;
using Microsoft.Extensions.DependencyInjection;
using System.Windows.Controls;
using LiveCharts;
using LiveCharts.Wpf;
using System;

namespace CarDealership.Views
{
    /// <summary>
    /// Логика взаимодействия для ReportView.xaml
    /// </summary>
    public partial class ReportView : Page
    {
        public ReportView()
        {
            InitializeComponent();
            DataContext = StaticInjector.Host.Services.GetService<ReportViewModel>();
        }
        

       
    }
}
