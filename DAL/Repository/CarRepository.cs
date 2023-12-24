using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Application.DTO;
using Application.Interfaces.Repository;
using DAL.EF;
using Domain.Entity;

namespace DAL.Repository
{
    public class CarRepository : ICarRepository
    {
        private DealershipDbContext dbContext;
        public CarRepository(DealershipDbContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public Car GetOne(long id)
        {
            return dbContext.Cars.Include("ConfigurationOptions").Include("Model.Brand").FirstOrDefault(e=>e.Id == id);
        }

        public bool Create(Car car, List<long> configurationOptions = null)
        {
            dbContext.Cars.Add(car);
            if (dbContext.GetValidationErrors().Any()) { dbContext.Cars.Remove(car); return false; }
            if (configurationOptions != null)
            {
                ConfigurationOption temp;
                foreach (long option in configurationOptions)
                {
                    temp = dbContext.ConfigurationOptions.Include("Cars").FirstOrDefault(e => e.Id == option);
                    if (temp != null) { temp.Cars.Add(car);}
                    
                }
            }
            if (dbContext.GetValidationErrors().Any()) { dbContext.Cars.Remove(car); return false; }
            return true;
        }

        public bool Delete(long id)
        {
            Car car = dbContext.Cars.Find(id);
            if (car != null)
            {
                dbContext.Cars.Remove(car);
                return true;
            }
            return false;
        }

        public List<Car> GetAllOnSale()
        {
            return dbContext.Cars.Include("ConfigurationOptions").Include("Model.Brand").Where(e=>e.Status == true).OrderBy(x => x.DateOfPublish).ToList();
        }

        public List<Car> GetOnSaleByFilter(long brandId, long modelId)
        {


            if (brandId <= 0 && modelId <= 0)
            {
                return dbContext.Cars.Include("ConfigurationOptions")
                                    .Include("Model.Brand")
                                    .Where(e => e.Status == true)
                                    .OrderBy(x => x.DateOfPublish)
                                    .ToList();
            }
            else if (brandId > 0 && modelId <= 0)
            {
                return dbContext.Cars.Include("ConfigurationOptions")
                                    .Include("Model.Brand")
                                    .Where(e => e.Status == true && e.Model.BrandId == brandId)
                                    .OrderBy(x => x.DateOfPublish)
                                    .ToList();
            }
            else if (brandId > 0 && modelId > 0)
            {
                return dbContext.Cars.Include("ConfigurationOptions")
                                    .Include("Model.Brand")
                                    .Where(e => e.Status == true && e.Model.BrandId == brandId && e.Model.Id == modelId)
                                    .OrderBy(x => x.DateOfPublish)
                                    .ToList();
            }
            else
            {
                return null;
            }
           
        }

        public bool Update(Car editedCar, List<long> configurationOptions = null)
        {
            Car car = dbContext.Cars.Find(editedCar.Id);
            
            if (car == null) { return false; }
            dbContext.Entry(car).CurrentValues.SetValues(editedCar);
            if (dbContext.GetValidationErrors().Any()) 
            { 
                dbContext.Entry(car).CurrentValues.SetValues(dbContext.Entry(car).GetDatabaseValues());
                return false; 
            }
            if (configurationOptions != null)
            {
                car.ConfigurationOptions.Clear();
                ConfigurationOption temp;
                foreach (long option in configurationOptions)
                {
                    temp = dbContext.ConfigurationOptions.FirstOrDefault(e => e.Id == option);
                    if (temp != null) {  car.ConfigurationOptions.Add(temp); }

                }
            }

            return true;
        }
    }
}
