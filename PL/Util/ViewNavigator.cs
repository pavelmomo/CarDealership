using System.Windows;
using CarDealership.Views;

namespace CarDealership.Util
{
    enum Views
    {
        AuthorizationView,
        MenuClientView,
        MenuManagerView
    }
    internal static class ViewNavigator
    {
        
        private static Window currentView_;
        private static Window currentView
        { 
            get => currentView_;
            set
            {
                currentView_ = value;
                currentView_.Show();
            }
        }
        public static void ApplicationStartNavigation()
        {
            currentView = new AuthorizationView();
            //SwitchViewTo(Views.MenuClientView);
           
        }
        public static void SwitchViewTo( Views destinationView)
        {

            Window previousView = currentView;
            switch (destinationView)
            {
                case Views.AuthorizationView:
                    currentView = new AuthorizationView();
                    break;
                case Views.MenuClientView:
                    currentView = new MenuClientView();
                    break;
                case Views.MenuManagerView:
                    currentView = new MenuManagerView();
                    break;
            }
            previousView.Close();
        }

    }
}
