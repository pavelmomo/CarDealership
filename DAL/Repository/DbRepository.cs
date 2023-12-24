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
    public class DbRepository : IDbRepository
    {
        private DealershipDbContext dbContext;
        private CarRepository carRepository;
        private ReportRepository reportRepository;
        private ModelRepository modelRepository;
        private ConfigurationOptionRepository configurationOptionRepository;
        private AccessoryRepository accessoryRepository;
        private DealRepository dealRepository;
        public DbRepository()
        {
            dbContext = new DealershipDbContext();
        
        }
        public ICarRepository Cars
        {
            get
            {
                return carRepository ?? (carRepository = new CarRepository(dbContext));
            }
        }
        public IModelRepository Models
        {
            get
            {
                return modelRepository ?? ( modelRepository = new ModelRepository(dbContext));
            }
        }

        public IConfigurationOptionRepository ConfigurationOptions
        {
            get
            {
                return configurationOptionRepository ?? (configurationOptionRepository = new ConfigurationOptionRepository(dbContext));
            }
        }
        public IAccessoryRepository Accessories
        {
            get
            {
                return accessoryRepository ?? (accessoryRepository = new AccessoryRepository(dbContext));
            }
        }

        public IDealRepository Deals
        {
            get
            {
                return dealRepository ?? (dealRepository = new DealRepository(dbContext));
            }
        }
        public IReportRepository Reports
        {
            get
            {
                return reportRepository ?? (reportRepository = new ReportRepository(dbContext));
            }
        }

        public int Save()
        {
            return dbContext.SaveChanges();
        }
    }
}
