using Application.Interfaces.Repository;
using DAL.EF;
using Domain.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repository
{
    public class AccessoryRepository : IAccessoryRepository
    {

        DealershipDbContext dbContext;
        public AccessoryRepository(DealershipDbContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public bool Create(Accessory accessory)
        {
            dbContext.Accessories.Add(accessory);
            if (dbContext.GetValidationErrors().Any()) { dbContext.Accessories.Remove(accessory); return false; }
            return true;
        }

        public bool Delete(int id)
        {

            Accessory accessory = dbContext.Accessories.Find(id);
            if (accessory != null)
            {
                accessory.Status = false;
                return true;
            }
            return false;
        }

        public List<Accessory> GetAllInSale()
        {
            return dbContext.Accessories.Where(e => e.Status == true)
                                        .OrderBy(x => x.Name)
                                        .ToList();
        }

        public Accessory GetOne(int id)
        {
            return dbContext.Accessories.Find(id);
        }

        public bool Update(Accessory accessory)
        {
            Accessory baseAccessory = dbContext.Accessories.Find(accessory.Id);
            if (accessory == null) { return false; }
            dbContext.Entry(baseAccessory).CurrentValues.SetValues(accessory);
            if (dbContext.GetValidationErrors().Any())
            {
                dbContext.Entry(accessory).CurrentValues.SetValues(dbContext.Entry(accessory).GetDatabaseValues());
                return false;
            }
            return true;
        }
    }
}
