using Application.DTO;
using Application.Interfaces.Repository;
using Application.Interfaces.Service;
using Domain.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Services
{
    public class AccessoryService : IAccessoryService
    {
        IDbRepository dbRepository;
        public AccessoryService(IDbRepository dbRepository)
        {
            this.dbRepository = dbRepository;
        }
        public List<AccessoryDTO> GetAccessories()
        {

            return dbRepository.Accessories.GetAllInSale().Select(e => new AccessoryDTO(e)).ToList();
        }
        public bool AddAccessory(AccessoryDTO accessory)
        {
            Accessory newAccessory = new Accessory()
            {
                Name = accessory.Name,
                Count = accessory.Count,
                Price = accessory.Price,
                Status = true

            };
            bool res = dbRepository.Accessories.Create(newAccessory);
            dbRepository.Save();
            return res;

        }
        public bool UpdateAccessory(AccessoryDTO accessory)
        {
            Accessory temp = dbRepository.Accessories.GetOne(accessory.Id);
            if (temp == null) { return false; }
            temp.Name = accessory.Name;
            temp.Count = accessory.Count;
            temp.Price = accessory.Price;
            bool res = dbRepository.Accessories.Update(temp);
            dbRepository.Save();
            return res;
        }
        public bool DeleteAccessory(int id)
        {
            bool res = dbRepository.Accessories.Delete(id);
            dbRepository.Save();
            return res;
        }
    }
}
