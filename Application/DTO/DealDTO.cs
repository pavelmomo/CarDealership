using Domain.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Application.DTO
{
    public class DealDTO : BaseNotifyDTO
    {
        private long _carId;
        private string _carName;
        private long _carPrice;
        private string _customerFIO;
        private string _customerPassport;
        private DateTime _customerDateOfBirth;
        private string _customerPlaceOfLiving;
        private long _customerTelephone;
        private long _totalPrice;
        private List<AccessoryDTO> _accessoriesFromCart;
        private string _carNameWithVIN;

        public long Id { get; set; }
        public DateTime Date { get; set; }
        public long CarId { get => _carId; set { _carId = value; OnPropertyChanged(); } }
        public int AgentId { get; set; }
        public string CarName { get => _carName; set { _carName = value; OnPropertyChanged(); } }
        public string CarNameWithRegNumber { get => _carNameWithVIN; set { _carNameWithVIN = value; OnPropertyChanged(); } }
        public long CarPrice { get => _carPrice; set { _carPrice = value; OnPropertyChanged(); } }
        public string AgentFIO { get; set; }
        public string CustomerFIO { get => _customerFIO; set { _customerFIO = value; OnPropertyChanged(); } }
        public string CustomerPassport { get => _customerPassport; set { _customerPassport = value; OnPropertyChanged(); } }
        public DateTime CustomerDateOfBirth { get => _customerDateOfBirth; set { _customerDateOfBirth = value; OnPropertyChanged(); } }
        public string CustomerPlaceOfLiving { get => _customerPlaceOfLiving; set { _customerPlaceOfLiving = value; OnPropertyChanged(); } }
        public long CustomerTelephone { get => _customerTelephone; set { _customerTelephone = value; OnPropertyChanged(); } }
        public long TotalPrice { get => _totalPrice; set { _totalPrice = value; OnPropertyChanged(); } }
        public List<int> Accessories { get; set; }
        public List<AccessoryDTO> AccessoriesFromCart { get => _accessoriesFromCart; set { _accessoriesFromCart = value; OnPropertyChanged(); } }
        public DealDTO(Deal deal)
        {
            Id = deal.Id;
            Date = deal.Date;
            CarId = deal.CarId;
            AgentId = deal.Agent.Id;
            AgentFIO = deal.Agent.Fio;
            CustomerFIO = deal.CustomerFIO;
            CustomerPassport = deal.CustomerPassport;
            DateTime.TryParse(deal.CustomerDateOfBirth,out _customerDateOfBirth);
            CustomerPlaceOfLiving = deal.CustomerPlaceOfLiving;
            CustomerTelephone = deal.CustomerTelephone;
            TotalPrice = deal.TotalPrice;
            CarName = deal.Car.Model.Brand.Name + " " + deal.Car.Model.Name;
            CarNameWithRegNumber = CarName + " " + deal.Car.RegistrationNumber;
            CarPrice = deal.Car.Price;
        }
        public DealDTO()
        {
            
        }


    }
}
