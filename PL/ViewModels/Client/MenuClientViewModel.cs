using CarDealership.Util;
using System;
using System.Collections.Generic;
using System.Windows.Controls;
using CarDealership.Views;


namespace CarDealership.ViewModels
{
    internal class MenuClientViewModel : BaseViewModel
    {
        CarShowcaseView carShowcasePage;
        DealerInfoView dealerInfoPage;
        Page currentPage;
        public Page CurrentPage
        {
            get { return currentPage; }
            set { currentPage = value; currentPage.IsEnabled = true; OnPropertyChanged(); }

        }
        public RelayCommand ExitCommand { get; private set; }
        public RelayCommand SwitchToCarShowcaseCommand { get; private set; }
        public RelayCommand SwitchToDealershipInfoCommand { get; private set; }
        public MenuClientViewModel()
        {
            ExitCommand = new RelayCommand((object e) =>
                        {
                            ViewNavigator.SwitchViewTo(Util.Views.AuthorizationView);
                        });

            SwitchToCarShowcaseCommand = new RelayCommand((object e) =>
                                            {
                                                CurrentPage = carShowcasePage ?? (carShowcasePage = new CarShowcaseView());
                                            },
                                            (object e) =>
                                            {
                                                return CurrentPage != carShowcasePage;
                                            });

            SwitchToDealershipInfoCommand = new RelayCommand((object e) =>
                                            {
                                                CurrentPage = dealerInfoPage ?? (dealerInfoPage = new DealerInfoView());
                                            },
                                            (object e) =>
                                            {
                                                return CurrentPage != dealerInfoPage;
                                            });
            SwitchToCarShowcaseCommand.Execute(null);
        }
        
        

    }
}
