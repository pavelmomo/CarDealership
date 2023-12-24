using Application.Interfaces.Repository;
using DAL.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repository
{
    public class ReportRepository : IReportRepository
    {
        DealershipDbContext dbContext;
        public ReportRepository(DealershipDbContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public int GetCarsStatisticByPrice(int startPrice, int endPrice, DateTime startDealDate)
        {
            if (endPrice == -1)
            {
                return dbContext.Deals.Include("Car")
                                  .Where(e => e.Car.Price >= startPrice && e.Date >= startDealDate)
                                  .Count();
            }


            return dbContext.Deals.Include("Car")
                                  .Where(e => e.Car.Price >= startPrice && e.Car.Price <= endPrice && e.Date >= startDealDate)
                                  .Count();
        }
    }
}
