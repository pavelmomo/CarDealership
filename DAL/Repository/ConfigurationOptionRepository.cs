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
    public class ConfigurationOptionRepository : IConfigurationOptionRepository
    {
        DealershipDbContext dbContext;
        public ConfigurationOptionRepository(DealershipDbContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public List<ConfigurationOption> GetAll()
        {
            return dbContext.ConfigurationOptions.OrderBy(e => e.Name).ToList();
        }
    }
}
