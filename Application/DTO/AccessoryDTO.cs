using Domain.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.DTO
{
    public class AccessoryDTO : BaseNotifyDTO, ICloneable
    {
        bool _isSelected;
        string _name;
        int _price;
        private bool _isActive;
        private int _count;
        private bool _status;

        public int Id { get; set; }
        public string Name { get => _name; set { _name = value; OnPropertyChanged(); } }
        public int Price { get => _price; set { _price = value; OnPropertyChanged(); } }
        public bool IsSelected { get => _isSelected; set { _isSelected = value; OnPropertyChanged(); } }
        public bool IsActive { get => _isActive; set { _isActive = value; OnPropertyChanged(); } }
        public bool Status { get => _status; set { _status = value; OnPropertyChanged(); } }
        public int Count { get => _count; set { _count = value; OnPropertyChanged(); } }
        public AccessoryDTO(Accessory accessory)
        {
            Id = accessory.Id;
            Name = accessory.Name;
            Price = accessory.Price;
            Count = accessory.Count;
            if (Count > 0)
                IsActive = true;
            IsSelected = false;
        }
        public AccessoryDTO()
        {
            Status = true;
        }
        public object Clone() => MemberwiseClone();
    }
}
