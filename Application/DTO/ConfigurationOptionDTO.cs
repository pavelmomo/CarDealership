using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.DTO
{
    public class ConfigurationOptionDTO : BaseNotifyDTO
    {
        private string _name;
        private bool _isSelected;

        public long Id {  get; set; }
        public string Name { get => _name; set { _name = value; OnPropertyChanged(); } }
        public bool IsSelected { get => _isSelected; set { _isSelected = value; OnPropertyChanged(); } }
    }
}
