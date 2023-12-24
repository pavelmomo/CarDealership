using Application.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces.Service
{
    public interface IAccessoryService
    {
        List<AccessoryDTO> GetAccessories();
        bool UpdateAccessory(AccessoryDTO accessory);
        bool AddAccessory(AccessoryDTO accessory);
        bool DeleteAccessory(int id);
    }
}
