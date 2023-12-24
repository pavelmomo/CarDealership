using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using CarDealership.Util;

namespace CarDealership.ViewModels
{
    internal class AuthorizationViewModel
    {
        public RelayCommand LoginCommand
        {
            get
            {
                return new RelayCommand(obj =>
                  {
                      string role = obj.ToString();
                      switch (role)
                      {
                          case "manager":
                              ViewNavigator.SwitchViewTo(Util.Views.MenuManagerView);
                              break;
                          case "client":
                              ViewNavigator.SwitchViewTo(Util.Views.MenuClientView);
                              break;
                      } 
                  });
            }
        }
    }
}
