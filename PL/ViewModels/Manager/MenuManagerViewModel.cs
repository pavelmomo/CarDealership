using CarDealership.Util;

using System.Windows.Controls;
using CarDealership.Views;

namespace CarDealership.ViewModels
{
    internal class MenuManagerViewModel : BaseViewModel
    {
        public RelayCommand SwitchToCarsListCommand { get; private set; }
        public RelayCommand SwitchToDealsCommand { get; private set; }
        public RelayCommand SwitchToAccessoriesCommand { get; private set; }
        public RelayCommand SwitchToReportCommand { get; private set; }
        public RelayCommand ExitCommand { get; private set; }
        CarsListView carsListPage;
        DealsView dealsPage;
        ReportView reportPage;
        AccessoryView accessoryPage;
        Page currentPage;
        public MenuManagerViewModel()
        {
            
            SwitchToCarsListCommand = new RelayCommand((object e) =>
                                    {
                                        carsListPage = new CarsListView();
                                        CurrentPage = carsListPage;
                                    },
                                    (object e) =>
                                    {
                                        return CurrentPage != carsListPage;
                                    });
            SwitchToDealsCommand = new RelayCommand((object e) =>
                                {
                                    dealsPage = new DealsView();
                                    CurrentPage = dealsPage;
                                },
                                (object e) =>
                                {
                                    return CurrentPage != dealsPage;
                                });
            SwitchToReportCommand = new RelayCommand((object e) =>
                                {
                                    reportPage = new ReportView();
                                    CurrentPage = reportPage;
                                },
                                (object e) =>
                                {
                                    return CurrentPage != reportPage;
                                });
            SwitchToAccessoriesCommand = new RelayCommand((object e) =>
                                {
                                    accessoryPage = new AccessoryView();
                                    CurrentPage = accessoryPage;
                                },
                                (object e) =>
                                {
                                    return CurrentPage != accessoryPage;
                                });

            ExitCommand = new RelayCommand((object e) =>
                        {
                            ViewNavigator.SwitchViewTo(Util.Views.AuthorizationView);
                        });
            SwitchToCarsListCommand.Execute(null);
        }
        
        public Page CurrentPage
        {
            get { return currentPage; }
            set { currentPage = value; OnPropertyChanged(); }

        }

    }
}
