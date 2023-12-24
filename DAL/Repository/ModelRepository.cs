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
    public class ModelRepository : IModelRepository
    {
        private DealershipDbContext dbContext;
        public ModelRepository(DealershipDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public List<Brand> GetAllBrands()
        {
            return dbContext.Brands.OrderBy(e => e.Name).ToList();
        }

        public List<Model> GetModelsByBrand(long brandId)
        {
            return dbContext.Models.Include("Cars")
                                    .Where(e => e.BrandId == brandId)
                                    .OrderBy(e => e.Name)
                                    .ToList();
        }
    }
}
