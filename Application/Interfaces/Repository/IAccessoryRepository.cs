using Domain.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces.Repository
{
    public interface IAccessoryRepository
    {
        bool Create(Accessory accessory);
        bool Update(Accessory accessory);
        bool Delete(int id);
        List<Accessory> GetAllInSale();
        Accessory GetOne(int id);
    }
}
