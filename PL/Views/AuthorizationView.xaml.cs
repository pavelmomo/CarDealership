using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using CarDealership.Util;
using CarDealership.ViewModels;
using Microsoft.Extensions.DependencyInjection;

namespace CarDealership
{
    /// <summary>
    /// Логика взаимодействия для AuthorizationView.xaml
    /// </summary>
    public partial class AuthorizationView : Window
    {
        public AuthorizationView()
        {
            InitializeComponent();
            DataContext = StaticInjector.Host.Services.GetService<AuthorizationViewModel>();
        }
    }
}
