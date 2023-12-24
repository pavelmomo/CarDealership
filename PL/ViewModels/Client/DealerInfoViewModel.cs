using Application.DTO;
using Application.Interfaces.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealership.ViewModels
{
    internal class DealerInfoViewModel : BaseViewModel
    {
        private DealershipDTO _dealership;
        public DealershipDTO Dealership { get => _dealership; set { _dealership = value; OnPropertyChanged(); } }
        public DealerInfoViewModel(IDealershipService dealershipService)
        {
            
            Dealership = dealershipService.GetDealershipInfo();
        }
       
    }
}
