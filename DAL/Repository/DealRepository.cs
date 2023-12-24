using Application.Interfaces.Repository;
using DAL.EF;
using Domain.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repository
{
    public class DealRepository : IDealRepository
    {
        DealershipDbContext dbContext;
        public DealRepository(DealershipDbContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public bool Create(Deal deal, List<int> accessoryIds = null)
        {
            dbContext.Deals.Add(deal);
            if (dbContext.GetValidationErrors().Any()) { dbContext.Deals.Remove(deal); return false; }

            if (accessoryIds != null)
            {
                foreach (var i in accessoryIds)
                {
                    Accessory temp = dbContext.Accessories.FirstOrDefault(x => x.Id == i && x.Status == true);
                    if(temp != null && temp.Count > 0)
                    {
                        temp.Count--;
                        dbContext.AccessoryCarts.Add(new AccessoryCart
                        {
                            Accessory = temp,
                            Deal = deal,
                            Price = temp.Price
                        });

                    }
                }
                if (dbContext.GetValidationErrors().Any()) { dbContext.Deals.Remove(deal); return false; }
            }

            
            return true;
        }
        public bool Delete(long id)
        {
            Deal dealToRemove = dbContext.Deals.Find(id);
            if (dealToRemove == null) { return false; }

            dbContext.Deals.Remove(dealToRemove);
            return true;
        }
        public Deal GetOne(long id)
        {
            return dbContext.Deals.Include("Agent")
                                  .Include("Car.Model.Brand")
                                  .Include("AccessoryCarts.Accessory")
                                  .FirstOrDefault(e => e.Id == id);
        }
        public List<Deal> GetAll()
        {

            return dbContext.Deals.Include("Agent")
                                  .Include("Car.Model.Brand")
                                  .OrderBy(deal => deal.Date)
                                  .ToList();
        }
    }
}
